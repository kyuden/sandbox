-module(linkmon).
-compile(export_all).

myproc() ->
  timer:sleep(5000),
  exit(reson).

chain(0) ->
  receive
    _ -> ok
  after 2000 ->
    exit("chan dies here")
  end;
chain(N) ->
  Pid = spawn(fun() -> chain(N-1) end),
  link(Pid),
  receive
    _ -> ok
  end.

start_critic() ->
  spawn(?MODULE, critic, []).

start_critic2() ->
  spawn(?MODULE, restarter, []).

restarter() ->
  process_flag(trap_exit, true),
  Pid = spawn_link(?MODULE, critic, []),
  register(critic, Pid),
  receive
    {'EXIT', Pid, normal} ->
      ok;
    {'EXIT', Pid, shutdown} ->
      ok;
    {'EXIT', Pid, _} ->
      restarter()
  end.

judge(Band, Alubum) ->
  Ref = make_ref(),
  critic ! {self(), Ref, {Band, Alubum}},
  receive
    {Ref, Criticism} -> Criticism
  after 2000 ->
    timeout
  end.

critic() ->
  receive
    {From, Ref, {"Rnage", "Unit"}} ->
      From ! {Ref, "They are great!"};
    {From, Ref, {"System", "Memoize"}} ->
      From ! {Ref, "They are'nt johinny crash but they are good"};
    {From, Ref, {"Jonny", "Token"}} ->
      From ! {Ref, "Simply"};
    {From, Ref, {_Band, _Album}} ->
      From ! {Ref, "They are terribule!"}
  end,
  critic().

