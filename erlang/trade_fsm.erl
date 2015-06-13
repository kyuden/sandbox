-module(trade_fsm).
-behavior(gen_fsm).
-compile(export_all).

-record(state, {name="",
                other,
                ownitems=[],
                otheritems=[],
                monitor,
                from}).

start(Name) ->
  gen_fsm:start(?MODULE, [Name], []).

start_link(Name) ->
  gen_fsm:start_link(?MODULE, [Name], []).

trade(OwnPid, OtherPid) ->
  gen_fsm:sync_send_event(OwnPid, {negotiate, OtherPid}, 30000).

accept_trade(OwnPid) ->
  gen_fsm:sync_send_event(OwnPid, accept_negotiate).

make_offer(OwnPid, Item) ->
  gen_fsm:send_event(OwnPid, {make_offer, Item}).

retract_offer(OwnPid, Item) ->
  gen_fsm:send_event(OwnPid, {retract_offer, Item}).

ready(OwnPid) ->
  gen_fsm:sync_send_event(OwnPid, ready, infinity).

cancel(OwnPid) ->
  gen_fsm:sync_send_all_state_event(OwnPid, cancel).

%%

ask_negotiate(OtherPid, OwnPid) ->
  gen_fsm:send_event(OtherPid, {ask_negotiate, OwnPid}).

accept_negotiate(OtherPid, OwnPid) ->
  gen_fsm:send_event(OtherPid, {accept_negotiate, OwnPid}).

do_offer(OtherPid, Item) ->
  gen_fsm:send_event(OtherPid, {do_offer, Item}).

undo_offer(OtherPid, Item) ->
  gen_fsm:send_event(OtherPid, {undo_offer, Item}).

%%

are_you_ready(OtherPid) ->
  gen_fsm:send_event(OtherPid, are_you_ready).

not_yet(OtherPid) ->
  gen_fsm:send_event(OtherPid, not_yet).

am_ready(OtherPid) ->
  gen_fsm:send_event(OtherPid, 'ready!').

%%

ack_trans(OtherPid) ->
  gen_fsm:send_event(OtherPid, ack).

ask_commit(OtherPid) ->
  gen_fsm:sync_send_event(OtherPid, ask_commit).

do_commit(OtherPid) ->
  gen_fsm:sync_send_event(OtherPid, do_commit).

notify_cancel(OtherPid) ->
  gen_fsm:send_all_state_event(OtherPid, cancel).

init(Name) ->
  {ok, idle, #state{name=Name}}.

notice(#state{name=N}, Str, Args) ->
  io:format("~s: "++Str++"~n", [N|Args]).

unexpected(Msg, State) ->
  io:format("~p received unknown event ~p while in state ~p~n", [self(), Msg, State]).

idle({ask_negotiate, OtherPid}, S=#state{}) ->
  Ref = monitor(process, OtherPid),
  notice(S, "~p asked for a trade negotiation", [OtherPid]),
  {next_state, idle_wait, S#state{other=OtherPid, monitor=Ref}};
idle(Event, Data) ->
  unexpected(Event, idle),
  {next_state, idle, Data}.

idle({negotiate, OtherPid}, From, S=#state{}) ->
  ask_negotiate(OtherPid, self()),
  notice(S, "asking user ~p for a trade", [OtherPid]),
  Ref = monitor(process, OtherPid),
  {next_state, idle_wait, S#state{other=OtherPid, monitor=Ref, from=From}};
idle(Event, _From, Data) ->
  unexpected(Event, idle),
  {next_state, idle, Data}.

idle_wait({ask_negotiate, OtherPid}, S=#state{other=OtherPid}) ->
  gen_fsm:reply(S#state.from, ok),
  notice(S, "starting negotiation", []),
  {next_state, negotiate, S};
idle_wait({accept_negotiate, OtherPid}, S=#state{other=OtherPid}) ->
  gen_fsm:reply(S#state.from, ok),
  notice(S, "starting negotiation", []),
  {next_state, negotiate, S};
idle_wait(Event, Data) ->
  unexpected(Event, idle_wait),
  {next_state, idle_wait, Data}.


































