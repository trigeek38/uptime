            <p> 
            <label for="title">Name</label>
            <input type="text" class="title" name="title" id="title" value="{{ id.title }}">
            </p>
            <p>
            <label for="title">Description</label>
            <input type="text" class="title" name="summary" id="summary" value="{{ id.summary }}">
            </p>
            <p>
            <label for="title">Location</label>
            <input type="text" class="title" name="location" id="location" value="{{ id.location }}">
            </p>
            <p>
            <label for="title">Room</label>
            <input type="text" class="title" name="room" id="room" value="{{ id.room }}">
            </p>
            <p>
            <label for="title">Model</label>
            <input type="text" class="title" name="model" id="model" value="{{ id.model }}">
            </p>
            <p>
            <label for="title">Serial</label>
            <input type="text" class="title" name="serial" id="serial" value="{{ id.serial }}">
            </p>
            <p>
            <label for="title">Status</label>
            <select class="title" name="status" id="status">
                <option value="up"{% ifequal id.status "up" %} selected {% endifequal %}>Up</option>
                <option value="down"{% ifequal id.status "down" %} selected {% endifequal %}>Down</option>
            </select>
            </p>
            <p>
            <label for="title">Log Message</label>
            <input type="text" class="title" name="log" id="log" >
            </p>
            {{ m.rsc[id].o.mfg[1].title }}
            {% validate id="log" failure_message="Please provide a comment" type={presence} %}
            {% validate id="title" failure_message="Please provide a comment" type={presence} %}
            {% validate id="summary" failure_message="Please provide a comment" type={presence} %}

