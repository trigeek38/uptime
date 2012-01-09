{% extends "uptime_base.tpl" %}

{% block container %}
    {% with m.rsc.signup_tos as id%}
        <p>{{ id.summary }}</p>
        {{ id.body }}
    {% endwith %}
{% endblock %}
