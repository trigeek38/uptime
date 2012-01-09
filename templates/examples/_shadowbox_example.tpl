<a href="#" rel="shadowbox[Residence]" title="Residence">Pics of my Home</a>
<a href="#" rel="shadowbox[Websites]" title="Websites">Taste of the Web</a>
<div style="display: none;">
{% for id in m.search[{latest cat="website" pagelen=10}] %}
    <a href="{{ id.website }}" rel="shadowbox[Websites]" title="Bell Residence">Homepage</a>
{% endfor %}

{% for i in m.search[{latest cat="collection" pagelen=10}] %}
    {% for m in m.rsc[i].media %}
        <a href="/media/inline/{{ m.media[m].filename }}" rel="shadowbox[Residence]" title="Bell Residence">Homepage</a>
    {% endfor %}
{% endfor %}
</div>

