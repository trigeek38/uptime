	{% wire id="chitchats-form" type="submit" postback={newchitchat id=id} delegate="mod_chitchat" %}
	<form id="chitchats-form" method="post" action="postback">
            <div style="display:none;"> 
     	        <input type="text" name="chat_name" id="chat_name" value="{{m.rsc[m.acl.user].name_first|default_if_none:"Anonymous"}}"/>
		{% validate id="chat_name"  type={presence} %}
            </div> 
            <div> 
                <label for="chat_message">Message </label>
                <input type="text" style="width:180px" name="chat_message" id="chat_message">
		{% validate id="chat_message" type={presence} %}
 	        <button type="submit" style="float:right">{_ Send _}</button> 
            </div> 
	</form>
