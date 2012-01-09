<ul id="chitchat-list" class="chitchats-list">
        {% for chitchat in m.chitchat.rsc[id] %}
            {% include "_chitchats_chitchat.tpl" %}
        {% empty %} 
            <div class="error"><p style="color: red;">No chat log for this resource</p></div>
        {% endfor %}
    </ul>

