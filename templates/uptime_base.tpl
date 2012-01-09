<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!-- Consider adding an manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">

  <!-- Use the .htaccess and remove these lines to avoid edge case issues.
       More info: h5bp.com/b/378 -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>Uptime</title>
  <meta name="description" content="Establishing Standards">
  <meta name="author" content="Jeff Bell">

  <!-- Mobile viewport optimized: j.mp/bplateviewport -->
  <meta name="viewport" content="width=device-width,initial-scale=1">

  <!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->

  <!-- CSS: implied media=all -->
  <!-- CSS concatenated and minified via ant build script-->
  <link rel="stylesheet" href="/lib/css/style2.css">
  <link rel="stylesheet" href="/lib/css/uptime.css">
  {% lib "css/jquery.loadmask.css" %}
  <!-- end CSS-->

  <!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

  <!-- All JavaScript at the bottom, except for Modernizr / Respond.
       Modernizr enables HTML5 elements & feature detects; Respond is a polyfill for min/max-width CSS3 Media Queries
       For optimal performance, use a custom Modernizr build: www.modernizr.com/download/ -->
  <script src="/lib/js/libs/modernizr-2.0.6.min.js"></script>
  {% block html_head_extra %}
  {% endblock %}

</head>

<body>

<div id="wrap">
<div id="header">
 <div class="container">
    <div class="span-24">
        <div class="span-18 last"><a href="{% url home %}"><h1>Uptime Center</h1></a></div>
        <div class="span-6 last">
           <span><ul id="menu">
               <li><a href="#" target="_self">Account</a></li>
               <li><a href="{% url grid %}" target="_self">Dashboard</a></li>
               <li><a href="{% url contact %}">Email Us</a></li>
           </ul></span>
        </div>
    </div>
 </div>
</div>

    <div id="container" class="container content_box">
    {% block container %}
    {% endblock %}
    </div>
</div>
<div id="footer">
<footer>
    <div class="container">
        <div class="span-18">
        <ul id="footer-sitemap">
            <li><h3>About Us</h3>
                <ul>
                    <li class="about_link" id="show_company"><a href="#">Company</a></li>
                    <li><a href="#">People</a></li>
                    <li><a href="#">Jobs</a></li>
                    <li><a href="#">Legal</a></li>
                    <li class="last contact_link"><a href="#">Contact Us</a></li>
                </ul>
            </li>
            <li><h3>Services</h3>
                <ul>
                    <li><a href="#">Consulting</a></li>
                    <li><a href="#">Hardware</a></li>
                    <li><a href="#">Software Development</a></li>
                    <li><a href="#">Service</a></li>
                    <li class="last"><a href="#">Disaster Recovery</a></li>
                </ul>
            </li>
            <li><h3>Support</h3>
                <ul>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Support Ticket</a></li>
                    <li class="last"><a href="#">Click-to-Call</a></li>
                </ul>
            </li>
        </ul>
        </div>

        <div class="span-5 last"><h3>Links</h3></div>
    </div>
</footer>
</div>


  <!-- JavaScript at the bottom for fast page loading -->
  {% include "_js_include.tpl" %}
{% lib
        "js/apps/zotonic-1.0.js"
        "js/apps/z.widgetmanager.js"
        "js/modules/z.notice.js"
        "js/modules/z.imageviewer.js"
        "js/modules/z.dialog.js"
        "js/modules/livevalidation-1.3.js"
        "js/modules/z.inputoverlay.js"
        "js/modules/jquery.loadmask.js"
%}

  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline 
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="/lib/js/libs/jquery-1.6.2.min.js"><\/script>')</script>
  -->
{% block js_include_extra %}
{% endblock %}


  <!-- scripts concatenated and minified via ant build script-->
  <script defer src="/lib/js/plugins.js"></script>
  <script defer src="/lib/js/script.js"></script>
  <!-- end scripts-->

	
  <!-- Change UA-XXXXX-X to be your site's ID -->
  <script>
    window._gaq = [['_setAccount','UAXXXXXXXX1'],['_trackPageview'],['_trackPageLoadTime']];
    Modernizr.load({
      load: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js'
    });
  </script>


  <!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
       chromium.org/developers/how-tos/chrome-frame-getting-started -->
  <!--[if lt IE 7 ]>
    <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
    <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
  <![endif]-->
{% lib "js/shadowbox.js" %}
<script type="text/javascript">Shadowbox.init();</script>
<script type="text/javascript">
$(function() {
$.widgetManager();
});
</script>


{% script %}
{% stream %}
  
</body>
</html>

