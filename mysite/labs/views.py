from labs.models import Lab, Class_Section, Quote
from django.template import RequestContext
from django.http import Http404
from django.shortcuts import render_to_response, render
import random


def is_admin(user):
    if user:
        return user.groups.filter(name='labstaff').count() == 1
    return false


def lab_home(request):
    return render_to_response(
        'labs/lab_home.html',
        {
        },
        RequestContext(request),
    )

def section_home(request, section_id):
    try:
        class_section = Class_Section.objects.get(pk=section_id)
    except:
        # invalid class selected
        raise Http404
    try:
        links = class_section.link.all()
	links = sorted(links, key=lambda links: links.pk)
    except:
        links = []
    try:
        first_quote = Quote.objects.random()
    except:
        first_quote = Quote.objects.all()[1]
    try:
        quotes = sorted(Quote.objects.exclude(pk=first_quote.id), key=lambda x: random.random())
    except:
        quotes = Quote.objects.exclude(pk=first_quote.id)
    return render_to_response(
        'labs/section_home.html',
        {
            'class_section': class_section,
            'links': links,
            'first_quote': first_quote,
            'quotes': quotes,
        },
        RequestContext(request),
    )


def lab_detail(request, lab_id):
    try:
        print lab_id
        lab = Lab.objects.get(pk=lab_id)
        section = lab.class_section
    except:
        # lab not found
        raise Http404
    # Make sure kids can't be sneaky
    if not lab.visible and not is_admin(request.user):
        raise Http404
    labstaff = is_admin(request.user)
    return render_to_response(
        'labs/lab_detail.html',
        {
            'lab': lab,
            'section': section,
            'is_labstaff': labstaff,
        },
        RequestContext(request),
    )


def schedule(request, section_id):
    try:
        section = Class_Section.objects.get(pk=section_id)
        labs = Lab.objects.filter(class_section=section).order_by('date')
        labstaff = is_admin(request.user)
    except:
        raise Http404
    return render_to_response(
        'labs/schedule.html',
        {
            'labs': labs,
            'section': section,
            'is_labstaff': labstaff,
        },
        RequestContext(request),
    )

