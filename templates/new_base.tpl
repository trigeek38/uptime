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

  <title></title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Mobile viewport optimized: j.mp/bplateviewport -->
  <meta name="viewport" content="width=device-width,initial-scale=1">

  <!-- Place favicon.ico and apple-touch-icon.png in the root directory: mathiasbynens.be/notes/touch-icons -->

  <!-- CSS: implied media=all -->
  <!-- CSS concatenated and minified via ant build script-->
  <link rel="stylesheet" href="/lib/css/style2.css">
  <link rel="stylesheet" href="/lib/css/uptime.css">
  <!-- end CSS-->

  <!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

  <!-- All JavaScript at the bottom, except for Modernizr / Respond.
       Modernizr enables HTML5 elements & feature detects; Respond is a polyfill for min/max-width CSS3 Media Queries
       For optimal performance, use a custom Modernizr build: www.modernizr.com/download/ -->
        {% lib "js/apps/modernizr.js" %}
    <!-- Place this tag in the <head> of your document-->
    <link href="https://plus.google.com/102502729130034893755" rel="publisher" />
{% block html_head_extra %}
{% endblock %}

</head>

<body>
<div id="wrap">
<div id="header">
<div id="contact"></div>
 <div class="container">
    <div class="span-24">
        <div class="span-18 last"><a href="{% url home %}"><h1>Uptime Center</h1></a></div>
        <div class="span-6 last">
           <span><ul id="menu">
               <li><a href="#" target="_self" id="test">Account</a></li>
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
        {% include "_footer.tpl" %}
        </div>
    </footer>
</div>
</div>


  <!-- JavaScript at the bottom for fast page loading -->


  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
  {% include "_js_include_jquery.tpl" %}

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

<script type="text/javascript">
$(function() {
$.widgetManager();
});
</script>
{% wire id="test" action={update target="contact" template="_contact_form.tpl"} 
 action={script script="
    $('#contact').modal({onOpen: function (dialog) {
                dialog.overlay.fadeIn('slow', function () {
                       dialog.data.hide();
                       dialog.container.fadeIn('slow', function () {
                          dialog.data.slideDown('slow');
                       });
                });
        },
        dataCss: {
                margin: 10
        },
        containerCss:{
                height:500,
                width:550
        },
        overlayClose:true
    });
"} %}

{% block js_include_extra %}{% endblock %}


  <!-- scripts concatenated and minified via ant build script-->
  <script defer src="/lib/js/plugins.js"></script>
  <script defer src="/lib/js/script.js"></script>
  <!-- end scripts-->


  <!-- Change UA-XXXXX-X to be your site's ID
  <script>
    window._gaq = [['_setAccount','UAXXXXXXXX1'],['_trackPageview'],['_trackPageLoadTime']];
    Modernizr.load({
      load: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js'
    });
  </script>
  -->

        {% stream %}
        {% script %}

  <!-- Prompt IE 6 users to install Chrome Frame. Remove this if you want to support IE 6.
       chromium.org/developers/how-tos/chrome-frame-getting-started -->
  <!--[if lt IE 7 ]>
    <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
    <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
  <![endif]-->

</body>
</html>
