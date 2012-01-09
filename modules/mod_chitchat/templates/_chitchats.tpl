<div id="chat-box">
    <ul id="chitchat-list" class="chitchats-list">
        {% for chitchat in m.chitchat.rsc[id] %}
            {% include "_chitchats_chitchat.tpl" %}
        {% empty %}
            <div class="error">No chat log for this resource</div>
        {% endfor %}
    </ul>
</div>
