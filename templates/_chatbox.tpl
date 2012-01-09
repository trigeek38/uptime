                <div class="span-6 inner_content_box">
                    <div id="mydiv" class="inner_content_box" style="height: 300px;overflow: auto;font-size: .7em;"></div>
                    <form id="myform" name="myform" action="" method="POST">
                    <input class="title span-6" type="text" name="mytext" id="myid">
                    {% button id="mybutton" text="Post" class="classy" action={insert_top target="mydiv" text="<p>This is cool</p>"} %}
                    </form>
                </div>

