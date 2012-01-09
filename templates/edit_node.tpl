{% extends "new_base.tpl" %}
{% block container %}
    <div class="span-24">
        <div class="span-12">
            {% wire id="node_form" type="submit" postback={edit_node id=id} delegate="mod_uptime_resource" %}
            <div class="span-12">
                <form id="node_form" name="node_form" action="postback" method="post">
                {% include "node_form.tpl" %}
            </div>
            <div class="span-12">
                <button class="classy" id="mybutton" type="submit">Update</button>
                </form>
            </div>
        </div>
        <div class="span-10 inner_content_box" style="font-size: .7em;" id="log_div">
            {% for i in m.rsc[id].log %}
                {{ i[1] }} - {{ i[2] }}<br>
            {% empty %}
                No logs available
            {% endfor %}
        </div>
            {% button class="classy" text="Clear Log" action={postback postback={clear_log id=id} delegate="mod_uptime_resource"} %} 
    </div>
{% endblock %}
