<script type="text/javascript">

$(function(){
        function moveFloatMenu() {
                var menuOffset = menuYloc.top + $(this).scrollTop() + "px";
                $('#floatMenu').animate({top:menuOffset},{duration:1000,queue:false});
        }

        menuYloc = $('#floatMenu').offset();

        $(window).scroll(moveFloatMenu);

        moveFloatMenu();
});

function slide(elementId, headerElement)
{
   var element = document.getElementById(elementId);
   if(element.up == null || element.down)
   {
      animate(elementId, 0, 600, 250, 0, 250, null);
      element.up = true;
      element.down = false;
      headerElement.innerHTML = 'Open Chat';
   }
   else
   {
      animate(elementId, 0, 0, 250, 600, 250, null);
      element.down = true;
      element.up = false;
      headerElement.innerHTML = 'Close Chat';
   }
}
</script>
