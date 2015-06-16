-module(musicians).
-behavior(gen_server).
-compile(export_all).

-record(state, {name="", role, skill=good}).
-define(DELAY, 750).


start_link(Role, Skill) ->
  gen_server:start_link({local, Role}, ?MODULE, [Role, Skill], []).

stop(Role) ->
  gen_server:call(Role, stop).

init([Role, Skill]) ->
  process_flag(trap_exit, true),
  random:seed(now()),
  TimeToPlay = random:uniform(3000),
  Name = pick_name(),
  StrRole = atom_to_list(Role),
  io:format("Start ~s as ~s~n", [Name, StrRole]),
  {ok, #state{name=Name, role=StrRole, skill=Skill}, TimeToPlay}.

pick_name() ->
  lists:nth(random:uniform(5), firstnames())
  ++ " " ++
  lists:nth(random:uniform(5), lastnames()).

firstnames() ->
  ["aa", "bb", "cc", "dd", "ee"].

lastnames() ->
  ["AA", "BB", "CCC", "DD", "EE"].

handle_call(stop, _From, S=#state{}) ->
  {stop, normal, ok, S};
handle_call(_Message, _From, S) ->
  {noreply, S, ?DELAY}.

handle_cast(_Message, S) ->
  {noreply, S, ?MODULE}.

handle_info(timeout, S=#state{name=N, skill=good}) ->
  io:format("~s produces sound!~n", [N]),
  {noreply, S, ?DELAY};
handle_info(timeout, S=#state{name=N, skill=bad}) ->
  case random:uniform(5) of
    1 ->
      io:format("~s played a false note~n", [N]),
      {stop, bad_note, S};
    _ ->
      io:format("~s produced sound~n", [N]),
      {noreply, S, ?DELAY}
  end;
handle_info(_Message, S) ->
  {noreply, S, ?DELAY}.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

terminate(normal, S) ->
  io:format("~s left the room (~s)~n", [S#state.name, S#state.role]);
terminate(bad_note, S) ->
  io:format("~s sucks (~s)~n", [S#state.name, S#state.role]);
terminate(shutdown, S) ->
  io:format("~s subway~n", [S#state.name]);
terminate(_Reason, S) ->
  io:format("~s kicked out(~s)~n", [S#state.name, S#state.role]).



