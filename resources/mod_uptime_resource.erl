-module(mod_uptime_resource).
-export([event/2]).

event({postback, {clear_log, [{id, NodeId}]}, _TriggerId, _TargetId}, Context) ->
    case m_rsc:p(NodeId, log, Context) of
        undefined -> ok;
        OldLog ->
            TmpLog = m_site:get(rsc_log_dir, Context) ++ integer_to_list(NodeId) ++ "." ++ get_timestamp() ++ ".log",
            ok = file:write_file(TmpLog, term_to_binary(OldLog)),
            m_rsc:update(NodeId, [{log, undefined}], Context)
    end,
    z_render:wire([{update,[ {target, "log_div"},{text, "<span>Logs deleted</span>"}]}
                           ], Context);
    

event({submit, {edit_node, [{id, NodeId}]}, _TriggerId, _TargetId}, Context) ->
    Title = z_context:get_q("title", Context),
    Summary = z_context:get_q("summary", Context),
    Location = z_context:get_q("location", Context),
    Room = z_context:get_q("room", Context),
    Model = z_context:get_q("model", Context),
    Serial = z_context:get_q("serial", Context),
    Status = z_context:get_q("status", Context),
    Log = z_context:get_q_validated("log", Context),

    case m_rsc:p(NodeId, log, Context) of 
        undefined ->
            Log2 = [{get_timestamp(), Status ++ " -> " ++Log}];
        OldLog ->
            Log2 = [{get_timestamp(), Status ++ " -> " ++Log}|OldLog] 
    end,

    Props = [ 
        {title, Title}, 
        {summary, Summary}, 
        {status, Status}, 
        {location, Location},
        {room, Room},
        {model, Model},
        {serial, Serial},
        {location, Location},
        {log, Log2}
    ],
    m_rsc_update:update(NodeId, Props, Context),
    mod_signal:emit({node_status_changed, [{id, NodeId}]}, Context),
    z_render:wire({redirect, [{dispatch, "grid"}]}, Context).

get_timestamp() ->
    {Y,M,D} = date(),
    {H,Min,S} = time(),
    {_,C,_} = now(),
    TS = integer_to_list(Y)++"-"++integer_to_list(M)++"-"++integer_to_list(D)++":"++integer_to_list(H)++":"++integer_to_list(Min)++":"++integer_to_list(S)++":"++integer_to_list(C),
    TS.
