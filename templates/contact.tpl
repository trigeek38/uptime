{% extends "new_base.tpl" %}

{% block container %}
<div class="span-24">
<div class="span-11">
   <h3 class="header_content_box" align="center">Contact Us</h3>
   <div class="span-9 content_box">
       <p>We love to hear from our customers.  Our inspiration comes from your feedback and suggestions.
          Please take this opportunity to share your thoughts with us.</p>
       <p>Here are just a few ideas...
       <ul>
           <li>How we can improve this site</li>
           <li>What additional functionality would you like</li>
           <li>What <i>sucks</i> about what we're doing</li>
           <li>What time is dinner served</li>
       </ul>
       </p>
   </div>
</div>
<div class="span-11 inner_content_box" id="contact_form">
     {% include "_contact_form.tpl" %}
</div>
</div>

{% endblock %}

