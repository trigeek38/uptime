-module(resource_admin_chitchats).
-author("5Nines LLC").

-export([
    is_authorized/2,
    event/2
]).

-include_lib("resource_html.hrl").

is_authorized(ReqData, Context) ->
    z_acl:wm_is_authorized(use, mod_chitchat, ReqData, Context).

html(Context) ->
        Html = z_template:render("admin_chitchats.tpl", [{page_admin_chitchats, true}], Context),
        z_context:output(Html, Context).

event({postback, {chitchat_delete, Args}, _TriggerId, _TargetId}, Context) ->
    ChitchatId = proplists:get_value(id, Args),
    case m_chitchat:delete(ChitchatId, Context) of
        ok ->
            OnSuccess = proplists:get_all_values(on_success, Args),
            Context1 = z_render:wire(OnSuccess, Context),
            z_render:growl(?__("The chat has been deleted.", Context1), Context1);
        {error, _Reason} ->
            %% Assume permission problem.
            z_render:growl_error(?__("You are not allowed to delete the chat.", Context), Context)
    end;

event({postback, {chitchat_toggle, Args}, _TriggerId, _TargetId}, Context) ->
    ChitchatId = proplists:get_value(id, Args),
    case m_chitchat:toggle(ChitchatId, Context) of
        {ok, IsVisible} ->
            OnSuccess = proplists:get_all_values(on_success, Args),
            Context1 = z_render:wire(OnSuccess, Context),
            case proplists:get_value(element, Args) of
                undefined ->
                    Context1;
                ElementId ->
                    case IsVisible of
                        true ->
                            z_render:wire({remove_class, [{target, ElementId},{class,"unpublished"}]}, Context1);
                        false ->
                            z_render:wire({add_class, [{target, ElementId},{class,"unpublished"}]}, Context1)
                    end
            end;
        {error, _Reason} ->
            %% Assume permission problem.
            z_render:growl_error(?__("You are not allowed to toggle the chat.", Context), Context)
    end.

