#!/usr/bin/env python
# This is the CGI script that creates the ipxe boot menu. The ipxe commands
# are actually created with each print statement. Any scripting language would
# work, and in fact the first effort was written in Perl. The important thing
# to remember is that anything not printed is Python, and anything printed is
# ipxe. The script can be tested from the command line by manually passing in
# the variables the script expects (mac address, hostname, etc). For example:
# ./boot.py mac="AA:BB:CC:DD:EE" hostname="SomeComputer"
# (Also note that in Python, all functions must be defined first)
#
#
# This system was designed and implemented by Mason Egger and Jared Wallace
# with valuable assistance from Asa Yeamans. You may contact the authors at
# jaredw@cs.txstate.edu and masone@txstate.edu
import cgi
import MySQLdb
import logging
import re
import sys

# start logging
logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s',datefmt='%m/%d/%Y %I:%M:%S %p',filename='/netboot/netboot.log',level=logging.INFO)

# This is where we query the 'hosts' database table to see if the client is
# registered.
# Pre:  The variable 'macaddress' contains the correct mac address of the client
#       attempting to netboot.
# Post: A tuple is returned containing three values: default OS, hostname, and
#       room number. If the client had no entry in the table, these values are
#       "none", "unregistered" and "none", respectively.
# Invariant: The variable 'macaddress'
def get_variable():
   cur.execute("SELECT count(DefaultOS), DefaultOS, Hostname, Room FROM hosts WHERE Mac = %s ",(macaddress,) )
   result = cur.fetchone()
   # If an entry exists, set the variables accordingly
   if result[0]:
      logging.info('Attempted host lookup successfully for host ' + macaddress)
      return result[1], result[2], result[3]
   else:
      logging.warning('unregistered host ' + macaddress + ' attempted netboot')
      return "none", "unregistered", "none"

# This function simply determines whether a given client has an entry in the
# 'error' database table.
# Pre:  The variable 'macaddress' contains the mac address of a client not
#       present in the hosts database table.
# Post: An integer has been returned with a value of 1 if an entry currently
#       exists for the client. A value of zero has been returned otherwise.
# Invariant: The variable 'macaddress' and the database table 'error'
def exists():
   cur.execute("SELECT count(1) FROM error WHERE Mac = (%s)", macaddress)
   result = cur.fetchone()
   if result[0]:
      logging.debug('Located previous record of unregistered host ' + macaddress + ' attempting netboot')
   else:
      logging.debug('Did not locate previous record of unregistered host ' + macaddress + ' attempting netboot')
   return result[0]

# This function adds a new entry into the 'error' database table.
# Pre:  The variable macaddress contains the mac address of a client not
#       present in the 'hosts' database table.
# Post: An entry has been created in the 'error' database table.
# Invariant: The variable 'macaddress'
def create_ticket():
   try:
      cur.execute("INSERT INTO error (Mac, Done) VALUES (%s, 'no')", macaddress)
      logging.debug('Successfully created ticket for host' + macaddress)
   except:
      logging.error('couldn\'t create ticket for host ' + macaddress)

# This function returns a ticket number for the client.
# Pre:  The variable macaddress contains the mac address of a client not
#       present in the 'hosts' database table, yet present in the error table.
# Post: The ticket number corresponding to the client's mac address has been
#       returned.
# Invariant: The variable 'macaddress'
def get_ticket():
   cur.execute("SELECT Ticket FROM error WHERE Mac = (%s)", macaddress)
   result = cur.fetchone()
   logging.debug('Successfully got ticket number for host ' + macaddress)
   return result[0]

# Here we handle clients not already registered in the 'hosts' database table
# Pre:  The variable 'macaddress' is the mac address of a computer not currently
#       registered in the 'hosts' database table.
# Post: If the client computer has previously tried to netboot, an error message
#       is printed with a contact email. If the client has never attempted to
#       netboot before, an entry is created in the 'error' database table with
#       the client's mac address. The database assigns a ticket number to that
#       client, which is then printed out along with contact information. The
#       script then directs iPxe to boot from the hard drive.
# Invariant: The variable 'macaddress'
def not_registered():
   # Clear the screen (using ascii escape and clear screen) to
   # reduce the clutter.
   print "set esc:hex 1b"
   print "set cls ${esc:string}[2J"
   print "echo ${cls}"
   if exists():
      print "echo Error, your machine is still not registered for netboot"
      print "echo Your ticket number is %d" % get_ticket()
      print "echo Please register at http://virgil.cs.txstate.edu with your ticket number"
      print "sleep 10"
      logging.debug('Printed error message for previous offender ' + macaddress)
      print "sanboot --no-describe --drive 0x80"
      sys.exit()
   # If not, add it to the error table and print the ticket number
   else:
      create_ticket()
      print "echo Your ticket number is %d" % get_ticket()
      print "echo Error, your machine is not registered for netboot"
      print "echo Please register at http://virgil.cs.txstate.edu with your ticket number"
      print "echo Your machine will now boot from the internal hard drive"
      print "sleep 10"
      logging.debug('Printed error message for first time offender ' + macaddress)
      print "sanboot --no-describe --drive 0x80"
      sys.exit()
# Now we start the script proper. First we print our header.
print "Content-Type: text/plain"
print
print "#!ipxe"

request = cgi.FieldStorage() # handle to data passed in by iPxe
macaddress = request["mac"].value
# We need to check for basic correctness of the mac address passed in
matched = re.compile('[0-9,a-f,:]{17,17}')
if re.match(matched, macaddress) is None:
   logging.critical('Non valid mac address %s passed to script', macaddress)
   print 'echo Your IP address is being logged. Further attempts may result in you being banned.'
   print
   print
   sys.exit('fake mac\'s kill kittens')

# Here we catch our development testing client and send it to virgil-development server
if macaddress == "00:26:b9:85:24:5a":
   print "chain http://147.26.102.32/bootD.py?mac=00:26:b9:85:24:5a"

Host = "localhost"
User = "hosttable"
Password = "***removed***"
Db = "HostTable"
db = MySQLdb.connect(Host,User,Password,Db)
cur = db.cursor()
result = get_variable()
os = result[0]
hostname = result[1]
room = result[2]
if os == "none":
   not_registered()
print ":loadmenu"
print "echo Loading Menu..."
print ("menu Welcome " + hostname + " Choose an OS")
print "item ubuntu Ubuntu"
print "item centOS CentOS"
print "item hdd Local Hard Drive"
if room == "Derr 231M":
   print "item windows Windows"
print "item steam Steam"
print ("choose --default " + os + " --timeout 8000 choice && goto ${choice}")



print ':ubuntu'
print 'initrd tftp://huntsville/ltsp/ubuntu/initrd.img || goto failed'
print 'chain tftp://huntsville/ltsp/ubuntu/vmlinuz ro initrd=initrd.img root=/dev/nbd0 nbdroot=147.26.100.51:ltsp_ubuntu init=/sbin/init-ltsp vt.handoff=7 quiet splash plymouth:force-splash || goto failed'

print ':centOS'
print 'initrd tftp://147.26.103.237/ltsp/i386/initrd.ltsp || goto failed'
print 'chain tftp://147.26.103.237/ltsp/i386/vmlinuz.ltsp rw initrd=initrd.ltsp init=/sbin/init-ltsp selinux=0 root=/dev/nfs nfsroot=147.26.103.237:/opt/ltsp/i386 nfsvers=3 video=LVDS-1:d rd_NO_LUKS rd_NO_LVM rd_NO_MD rd_NO_DM LANG=en_US.UTF-8 SYSFONT=latarcyrheb-sun16 KEYBOARDTYPE=pc KEYTABLE=us crashkernel=auto rhgb || goto failed'

print ':failed'
print 'imgfree'
print 'goto loadmenu'

print ':hdd'
print 'sanboot --no-describe --drive 0x80'

print ':windows'
print 'chain http://theonering/boot/menu.pl?os=${os}&mac=${net0/mac}&model=${smbios/product}&serial=${smbios/serial}&uuid=${smbios/uuid} || goto error1'

print ':steam'
print 'echo Congratulations, you have just been assigned a failing grade.'
print 'echo Perhaps next time you won\'t goof off like this.'
print 'sleep 10'
print 'goto loadmenu'
