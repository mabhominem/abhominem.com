---
layout: default
title: Indications
---

This page contains a collection of resources for a handful of
different topics. I eventually got tired of having to repeatedly track
down links and code examples for people, so I've decided to centralize
everything here.

{% for cat in site.category-list %}
### [{{ cat }}](indication_{{ cat }})
<ul>
{% for page in site.pages %}
{% if page.resource == true %}
{% for pc in page.category %}
{% if pc == cat %}
<li>
  <a href="{{ page.url }}">{{ page.title | replace: '_', ' ' }}</a> ({{ page.medname }}) &mdash; <a href="{{ page.target[0] }}">{{ page.target[0] }}</a> <a href="{{ page.target[1] }}">{{ page.target[1] }}</a>
</li>  
{% endif %} <!-- cat-match-p -->
{% endfor %} <!-- page-category -->
{% endif %} <!-- resource-p -->
{% endfor %} <!-- page -->
</ul>
{% endfor %} <!-- cat -->