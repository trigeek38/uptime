{% wire action={connect signal={chat session = id} action={postback postback={newchitchat id=id} delegate="mod_chitchat" }}  %}
<div id="floatMenu" style="display: normal;">
  <div id="chatHeader" holder="slide('chatPanel', this);">
    Close Chat
  </div>
  <div id="chatPanel">
      <div id="chat-box-container">
          {% include "_chitchats.tpl" id=id %}
      </div>
      <div class="clearfix"></div>
          {% include "_chitchats_form.tpl" id=id %}
      </div>
  </div>
