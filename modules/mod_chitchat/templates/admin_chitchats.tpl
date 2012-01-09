{% extends "admin_base.tpl" %}

{% block title %}
{_ Recent Chitchats _}
{% endblock %}

{% block content %}
        <div id="content" class="zp-85">
                <div class="block clearfix">

                        <h2>{_ Chitchats _}</h2>

                        <h3 class="above-list">{_ Recent Chitchats _}</h3>
                        <ul class="short-list">
                                <li class="headers clearfix">
                                        <span class="zp-15">{_ Added on _}</span>
                                        <span class="zp-15">{_ Page _}</span>
                                        <span class="zp-25">{_ Message _}</span>
                                        <span class="zp-15">{_ Name _}</span>
                                        <span class="zp-15">{_ Options _}</span>
                                </li>
                        {% with m.search.paged[{recent_chitchats page=q.page}] as result %}
                                {% for chitchat in result %}
                                        {% with chitchat.id as id %}
                                        <li {% if not chitchat.is_visible %}class="unpublished" {% endif %}>
                                                <a id="{{ #chitchat.id }}" href="{{ m.rsc[chitchat.rsc_id].page_url }}#chitchat-{{ id }}" class="clearfix">
                                                        <span class="zp-15">{{ chitchat.created|date:"d M Y, H:i" }}</span>
                                                        <span class="zp-15">{{ m.rsc[chitchat.rsc_id].title|truncate:20 }}</span>
                                                        <span class="zp-25">{{ chitchat.message|striptags|truncate:40 }}</span>
                                                        {% if chitchat.user_id %}
                                                                <span class="zp-30">{{ m.rsc[chitchat.user_id].title }} [#{{ chitchat.user_id }}]</span>
                                                        {% else %}
                                                                <span class="zp-15">{{ chitchat.name|truncate:20 }}</span>
                                                        {% endif %}
                                                        <span class="zp-15">
                                    {% button text=_"view" action={redirect location=[m.rsc[chitchat.rsc_id].page_url,"#chitchat-",id|format_integer]|join } %}
                                                                {% button text=_"delete" postback={chitchat_delete id=id on_success={slide_fade_out target=#chitchat.id}} %}
                                                        </span>
                                                </a>
                                        </li>
                                        {% endwith %}
                                {% empty %}
                                    <li>{_ There are no chitchats. _}</li>
                                {% endfor %}
                                </ul>

                                {% pager result=result dispatch="admin_chitchats" qargs %}

                        {% endwith %}

                </div>
        </div>
{% endblock %}

