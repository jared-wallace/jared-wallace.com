from django.template import RequestContext
from django.http import Http404
from django.shortcuts import render_to_response, render

def index(request):
    #return render_to_response('base/index.html',
	#RequestContext(request),
    #)
    return render(request, 'base/index.html'
)

def ks(request):
    return render_to_response('base/mcu-ks.cfg',
    RequestContext(request),
    )

def about(request):
    return render_to_response('base/about.html',
	RequestContext(request),
    )

def noemi(request):
    return render_to_response('base/noemi.html',
    RequestContext(request),
    )
