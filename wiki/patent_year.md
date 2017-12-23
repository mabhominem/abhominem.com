---
layout: default
title: Patent Filing by Years
---

This page contains a collection of resources for a handful of
different topics. I eventually got tired of having to repeatedly track
down links and code examples for people, so I've decided to centralize
everything here.


{% for cat in site.patent-list %}
### {{ cat }}
<ul>
{% for page in site.pages %}
{% if page.resource == true %}
{% for pc in page.patent %}
{% if pc == cat %}
<li>
  <a href="{{ page.url }}">{{ page.title | replace: '_', ' ' }}</a> &mdash; {{ page.desc }}
</li>
{% endif %} <!-- cat-match-p -->
{% endfor %} <!-- page-category -->
{% endif %} <!-- resource-p -->
{% endfor %} <!-- page -->
</ul>
{% endfor %} <!-- cat -->
