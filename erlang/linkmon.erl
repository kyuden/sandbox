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

judge(Pid, Band, Alubum) ->
  Pid ! {self(), {Band, Alubum}},
  receive
    {Pid, Criticism} -> Criticism
  after 2000 ->
    timeout
  end.

critic() ->
  receive
    {From, {"Rnage", "Unit"}} ->
      From ! {self(), "They are great!"};
    {From, {"System", "Memoize"}} ->
      From ! {self(), "They are'nt johinny crash but they are good"};
    {From, {"Jonny", "Token"}} ->
      From ! {self(), "Simply"};
    {From, {_Band, _Album}} ->
      From ! {self(), "They are terribule!"}
  end,
  critic().

