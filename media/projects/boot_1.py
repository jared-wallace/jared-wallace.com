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
# This script and was written and the database designed by Jared Wallace.
# The web admin interface was authored by Mason Egger.
# You may contact the authors at wallace@jared-wallace.com and masone@txstate.edu
import cgi
import MySQLdb
import logging
import re
import sys
import os

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

# Hre we want to compare the clients current ip address with the ip
# address stored in the database. If they differ, we want to update
# the database. This serves a couple of purposes, one of which is
# so we can chase down misbehaving clients, the other is to ease
# the task of joining newly imaged Windows clients to the domain.
#
# Pre:  The variable 'ipaddr' has the ip address of the client booting,
#       and the variable 'macaddress' has mac address of the client booting.
# Post: The database entry for the client has been updated with the current
#       ip.
# Invariant: The two variables ipaddr and macaddress
def compareip(ipaddr, macaddress):
   cur.execute("SELECT IP FROM hosts WHERE Mac = (%s)", macaddress)
   result = cur.fetchone()
   if result[0]:
      logging.debug('We have a result for host %s' + macaddress)
      if result[0] == ipaddr:
         logging.debug('IP matched current record for host' + macaddress)
         pass
      else:
         try:
            cur.execute("UPDATE hosts SET IP = (%s) WHERE Mac = (%s)", (ipaddr, macaddress))
            logging.debug('Successfully updated IP for host' + macaddress)
         except:
            logging.error('couldn\'t update IP for host ' + macaddress)
   else:
      try:
         cur.execute("UPDATE hosts SET IP = (%s) WHERE Mac = (%s)", (ipaddr, macaddress))
         logging.debug('Successfully wrote IP record for host' + macaddress)
      except:
         logging.error('couldn\'t write new IP record for host ' + macaddress)


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
#if macaddress == "00:25:64:b3:2f:9c":
#   print "chain http://147.26.103.226/bootD.py?mac=00:25:64:b3:2f:9c"

Host = "*nuked*"
User = "*nuked*"
Password = "*nuked*"
Db = "*nuked*"
db = MySQLdb.connect(Host,User,Password,Db)
cur = db.cursor()

# Attempting to get latest ip address from the client
try:
   ipaddr = os.environ["REMOTE_ADDR"]
   logging.debug('Successfully obtained IP address %s for host %s', os.environ["REMOTE_ADDR"], macaddress)
   compareip(ipaddr, macaddress)
except:
   logging.debug('failed to get IP from client')
   pass
result = get_variable()
os = result[0]
hostname = result[1]
room = result[2]
if os == "none":
   not_registered()
print ":loadmenu"
print "echo Loading Menu..."
print ("menu Welcome " + hostname + " Choose an OS")
print "item ubuntu14 Ubuntu 14.04"
print "item ubuntu Ubuntu 12.04"
print "item centOS CentOS"
print "item hdd Local Hard Drive"
if room == "Derr 231M" or room == "Derr 231A":
   print "item acm ACM"
if room== "Derr 236":
   print "item embedded Embedded Systems"
print "item steam Steam"
print ("choose --default " + os + " --timeout 8000 choice && goto ${choice}")



print ':ubuntu'
print 'initrd tftp://huntsville/ltsp/ubuntu/initrd.img || goto failed'
print 'chain tftp://huntsville/ltsp/ubuntu/vmlinuz ro initrd=initrd.img root=/dev/nbd0 nbdroot=147.26.100.51:ltsp_ubuntu init=/sbin/init-ltsp vt.handoff=7 quiet splash plymouth:force-splash || goto failed'

print ':ubuntu14'
print 'initrd tftp://huntsville2/ltsp/amd64/initrd.img || goto failed'
print 'chain tftp://huntsville2/ltsp/amd64/vmlinuz ro initrd=initrd.img root=/dev/nbd0 nbdroot=147.26.102.171:/opt/ltsp/amd64 init=/sbin/init-ltsp vt.handoff=7 plymouth:force-splash || goto failed'

print ':centOS'
print 'initrd tftp://147.26.103.237/ltsp/i386/initrd.ltsp || goto failed'
print 'chain tftp://147.26.103.237/ltsp/i386/vmlinuz.ltsp rw initrd=initrd.ltsp init=/sbin/init-ltsp selinux=0 root=/dev/nfs nfsroot=147.26.103.237:/opt/ltsp/i386 nfsvers=3 video=LVDS-1:d rd_NO_LUKS rd_NO_LVM rd_NO_MD rd_NO_DM LANG=en_US.UTF-8 SYSFONT=latarcyrheb-sun16 KEYBOARDTYPE=pc KEYTABLE=us crashkernel=auto rhgb || goto failed'

print ':failed'
print 'imgfree'
print 'goto loadmenu'

print ':hdd'
print 'sanboot --no-describe --drive 0x80'

print ':acm'
print 'initrd tftp://huntsville2/ltsp/ACM/initrd.img || goto failed'
print 'chain tftp://huntsville2/ltsp/ACM/vmlinuz ro initrd=initrd.img root=/dev/nbd0 nbdroot=147.26.102.171:ACM init=/sbin/init-ltsp vt.handoff=7 plymouth:force-splash || goto failed'

print ':embedded'
print 'initrd tftp://huntsville2/ltsp/TinyOS/initrd.img || goto failed'
print 'chain tftp://huntsville2/ltsp/TinyOS/vmlinuz ro initrd=initrd.img root=/dev/nbd0 nbdroot=147.26.102.171:Embedded init=/sbin/init-ltsp vt.handoff=7 plymouth:force-splash || goto failed'

print ':steam'
print 'echo Congratulations, you have just been assigned a failing grade.'
print 'echo Perhaps next time you won\'t goof off like this.'
print 'sleep 10'
print 'goto loadmenu'
