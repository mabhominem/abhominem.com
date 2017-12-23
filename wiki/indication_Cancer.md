---
layout: default
title: Anti-Cancer mAbs
---

This page contains a collection of resources for a handful of
different topics. I eventually got tired of having to repeatedly track
down links and code examples for people, so I've decided to centralize
everything here.


### {{page.title}}
<ul>
{% for page in site.pages %}
{% if page.resource == true %}
{% for pc in page.category %}
{% if pc == "Cancer" %}
<li>
  <a href="{{ page.url }}">{{ page.title | replace: '_', ' ' }}</a> &mdash; {{ page.medname }} &mdash; <a href="{{ page.target[0] }}">{{ page.target[0] }}</a> <a href="{{ page.target[1] }}">{{ page.target[1] }}</a> 
</li>
{% endif %} <!-- cat-match-p -->
{% endfor %} <!-- page-category -->
{% endif %} <!-- resource-p -->
{% endfor %} <!-- page -->
</ul>
