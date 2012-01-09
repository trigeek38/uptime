{% extends "uptime_base.tpl" %}
{% block container %}
    <div class="span-24">
        {# left panel #} 
            {% block left_panel %}
                 {% include "_home_left_panel.tpl" %}
            {% endblock %}
        {# center spacing #} 
                <div class="span-1">&nbsp;</div>
        {# right spacing #} 
            {% block left_panel %}
                {% include "_home_right_panel.tpl" %}
            {% endblock %}
    </div>
{% endblock %}
