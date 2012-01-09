{% extends "new_base.tpl" %}
{% block html_head_extra %}
    <link rel="stylesheet" href="/lib/css/chit_chat.css">
{% endblock %}

{% block container %}
{% block left %}
        <div class="span-16" id="left">
        <h2>{{ id.title }}</h2>
        <div class="span-10" id="sample"><p>&nbsp;</p></div>
        <div class="span-16" id="news_item_{{ id }}">
            <p>{{ id.publication_start }}</p>
            <hr class="space">
            <i>{{ id.summary }} </i>
            <hr class="space">
        </div>
        </div>
{% endblock %}
   {% include "_chat_plugin.tpl" %}
{% endblock %}

{% block js_include_extra %}

{% lib "js/_chat_js.js" %}

<script>

$(function(){
    $('#chatHeader').click(function() {
        $("#chatPanel").toggle();
    });
});

</script>
{% endblock %}


