from django.template import RequestContext
from django.http import Http404
from django.shortcuts import render_to_response
from projects.models import Project

def index(request):
    projects = Project.objects.all()
    return render_to_response(
	'projects/index.html',
        {
	    'Projects': projects,
	    },
	RequestContext(request),
    )

def list(request, type):
    projects = Project.objects.filter(classification=type)
    if type == "school":
        header_content = "These are projects I've completed at "
        header_content += "the behest of certain classes."
    elif type == "work":
        header_content = "These are some of the things I've tackled "
        header_content += "while in the course of working. Some were directed, most were independent."
    else:
        header_content = "Here are the few things I've been able to do in my free time."
    return render_to_response(
        'projects/list.html',
        {
            'Projects': projects,
            'header_content': header_content,
            'type': type,
        },
        RequestContext(request),
    )

def detail(request, id):
    try:
        project = Project.objects.get(pk=id,)
    except:
        raise Http404
    image_list = project.images.all()
    return render_to_response(
	'projects/detail.html',
	{
	    'project':project,
        'images': image_list,
	},
	RequestContext(request),
    )
