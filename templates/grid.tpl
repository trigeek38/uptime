{% extends "new_base.tpl" %}
{% block container %}
            <div class="span-24" id="nodes">
                <div class="span-22">
                        {% for modality_id in m.search[{query cat="modality" sort="pivot_title"}] %}
                    <div class="span-22">
                            <h4>{{ modality_id.title }}</h4> 
                            {% for node_id in  m.rsc[modality_id.id].s.is_modality %}
                            <div class="span-3 inner_content_box {{node_id.status}}"><p align="center">
                                <a href="{% url edit_node id=node_id.id %}" class="tooltip" title="{{node_id.summary}}">
                                  {{node_id.title}}
                                </a></p>
                            </div>
                            {% endfor %}
                    </div>
                        {% endfor %}
                </div>
            </div>

    {% wire action={connect signal={node_status_changed}
                    action={update target="nodes" template="_nodes.tpl"}
                   }
    %}

{% endblock %}
