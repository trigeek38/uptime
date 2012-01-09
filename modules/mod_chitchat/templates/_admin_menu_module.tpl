{% if m.acl.use.mod_chitchat %}
<li><a href="{% url admin_chitchats %}" {% if page_admin_chitchats %}class="current"{% endif %}>{_ Chitchats _}</a></li>
{% endif %} 
