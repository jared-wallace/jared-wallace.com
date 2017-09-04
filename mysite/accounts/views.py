from accounts.forms import EmailForm
from accounts.models import Contact_Information
from django.shortcuts import render_to_response, render
from django.template import RequestContext
from django.http import Http404, HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse, reverse_lazy
from django.core.mail import EmailMessage
from django.utils.html import strip_tags


def contact(request):
    try:
        contact = Contact_Information.objects.all()[0]
    except:
        raise Http404
    if request.method == 'POST':
        form = EmailForm(data=request.POST)
        if form.is_valid():
            subject = form.cleaned_data['subject']
            recipients = ["root@localhost",]
            message = form.cleaned_data['message']
            # Remove html formatting
            message = strip_tags(message)
            from_email = form.cleaned_data['email']
            email = EmailMessage(
                        subject=subject,
                        body=message,
                        from_email=from_email,
                        bcc=recipients
            )
            email.send()
            return render(
                request,
                'accounts/thanks.html',
                {},
            )
        else:
            print form.errors
    else:
        form = EmailForm()
    return render_to_response(
            'accounts/contact.html',
            {
                'form': form,
                'contact': contact,
            },
            RequestContext(request)
            )
