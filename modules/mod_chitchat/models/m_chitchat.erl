%% @doc chitchat model. 

%% Copyright 2011 Jeff Bell
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.



-module(m_chitchat).
-author("Jeff Bell <jeff.5nines@gmail.com").

-behaviour(gen_model).

%% interface functions
-export([
    m_find_value/3,
    m_to_list/2,
    m_value/2,
    list_rsc/2,
    get/2,
    insert/4,
    delete/2,
    search/3
]).

-include_lib("zotonic.hrl").

%% @doc Cache time for chitchat listings and chitchat counts.
-define(MAXAGE_CHITCHAT, 0).


%% @doc Fetch the value for the key from a model source
%% @spec m_find_value(Key, Source, Context) -> term()
m_find_value(rsc, #m{value=undefined} = M, _Context) ->
    M#m{value=rsc};
m_find_value(Id, #m{value=rsc}, Context) ->
    % All chitchat of the resource.
    list_rsc(Id, Context);
m_find_value(links, #m{value=undefined} = M, _Context) ->
    M#m{value=links};
m_find_value(Id, #m{value=links}, Context) ->
    list_links(Id, Context);
m_find_value(count, #m{value=undefined} = M, _Context) ->
    M#m{value=count};
m_find_value(Id, #m{value=count}, Context) ->
    count_rsc(Id, Context);
m_find_value(sum, #m{value=undefined} = M, _Context) ->
    M#m{value=sum};
m_find_value(Id, #m{value=sum}, Context) ->
    sum_rsc(Id, Context);
m_find_value(_Key, #m{value=undefined}, _Context) ->
   undefined.

%% @doc Transform a m_config value to a list, used for template loops
%% @spec m_to_list(Source, Context)
m_to_list(_, _Context) ->
    [].

%% @doc Transform a model value so that it can be formatted or piped through filters
%% @spec m_value(Source, Context) -> term()
m_value(#m{value=undefined}, _Context) ->
    undefined.



%% @doc List all chitchat of the resource.
%% @spec list_rsc(int(), Context) -> [ PropList ]
list_rsc(RscId, Context) when is_integer(RscId) ->
    ChatLimit = m_site:get(chat_limit, Context),
    F = fun() ->
        z_db:assoc_props("select * from chitchat where rsc_id = $1 order by created desc limit $2", [RscId, ChatLimit], Context)
    end,
    z_depcache:memo(F, {chitchat_rsc, RscId}, ?MAXAGE_CHITCHAT, Context).

list_links(RscId, Context) when is_integer(RscId) ->
    F = fun() ->
        z_db:assoc_props("select * from chitchat where rsc_id = $1 and message like '%http%' order by created desc", [RscId], Context)
    end,
    z_depcache:memo(F, {chitchat_rsc, RscId}, ?MAXAGE_CHITCHAT, Context).


%% @doc List all chitchat of the resource.
%% @spec list_rsc(int(), Context) -> [ PropList ]
count_rsc(RscId, Context) when is_integer(RscId) ->
    F = fun() ->
        z_db:q1("select count(*) from chitchat where rsc_id = $1", [RscId], Context)
    end,
    z_depcache:memo(F, {chitchat_rsc_count, RscId}, ?MAXAGE_CHITCHAT, [{chitchat_rsc, RscId}], Context).
    
sum_rsc(RscId, Context) when is_integer(RscId) ->
    F = fun() ->
        z_db:q1("select sum(id) from chitchat where rsc_id = $1", [RscId], Context)
    end,
    z_depcache:memo(F, {chitchat_rsc_sum, RscId}, ?MAXAGE_CHITCHAT, [{chitchat_rsc, RscId}], Context).

%% @spec Fetch a specific chitchat from the database.
%% @spec get(int(), Context) -> PropList
get(ChitChatId, Context) ->
    z_db:assoc_props_row("select * from chitchat where id = $1", [ChitChatId], Context).


%% @doc Insert a new chitchat. Fetches the submitter information from the Context.
%% @spec insert(Id:int(), Name::string(), Email::string(), Message::string(), Context) -> {ok, WorkorderId} | {error, Reason}
%% @todo Insert external ip address and user agent string
insert(RscId, Name, Message, Context) ->
	case z_acl:rsc_visible(RscId, Context) 
		and (z_auth:is_auth(Context) 
			orelse z_convert:to_bool(m_config:get_value(mod_workorder, anonymous, true, Context))) of
		true ->
		    Name1 = z_html:escape(z_string:trim(Name)),
		    Message1 = z_html:escape_link(z_string:trim(Message)),
		    Props = [
		        {rsc_id, z_convert:to_integer(RscId)},
		        {is_visible, true},
		        {name, Name1},
		        {message, Message1},
		        {ip_address, ""}
		    ],
		    case z_db:insert(chitchat, Props, Context) of
		        {ok, _ChitChatId} = Result ->
		            z_depcache:flush({chitchat_rsc, RscId}, Context),
		            Result;
		        {error, _} = Error ->
		            Error
		    end;
		false ->
			{error, eacces}
	end.


%% @doc Delete a chitchat.  Only possible if the user has edit permission on the page.
delete(ChitChatId, Context) ->
    case z_db:q1("select rsc_id from chitchat where id = $1", [ChitChatId], Context) of
        undefined -> {error, enoent};
        RscId ->
            case z_acl:rsc_editable(RscId, Context) of
                true ->
                    z_db:q("delete from chitchat where id = $1", [ChitChatId], Context),
                    z_depcache:flush({chitchat_rsc, RscId}, Context),
                    ok;
                false ->
                    {error, eacces}
            end
    end.


%% @doc Return the search as used by z_search and the search model.
search({recent_chitchats, []}, _OfffsetLimit, _Context) ->
    #search_sql{
        select="c.*",
        from="chitchat c",
        order="c.created desc",
        assoc=true
    }.
