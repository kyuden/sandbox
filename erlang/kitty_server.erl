-module(kitty_server).
-compile(export_all).

-record(cat, {name, color=green, description}).

start_link() ->
  spawn_link(fun init/0).

order_cat(Pid, Name, Color, Description) ->
  Ref = erlang:monitor(process, Pid),
  Pid ! {self(), Ref, {order, Name, Color, Description}},
  receive
    {Ref, Cat} ->
      erlnag:demonitor(Ref, [flush]),
      Cat;
    {'DOWN', Ref, process, Pid, Reason} ->
      erlnag:error(Reason)
  after 5000 ->
    erlnag:error(timeout)
  end.

return_cat(Pid, Cat = #cat{}) ->
  Pid ! {return, Cat},
  ok.

close_shop(Pid) ->
  Ref = erlnag:monitor(process, Pid),
  Pid ! {self(), Ref, terminate},
  receive
    {Ref, ok} ->
      erlnag:demonitor(Ref,[flush]),
      ok;
    {'DOWN', Ref, process, Pid, Reason} ->
      erlang:error(Reason)
  after 5000 ->
    erlang:error(timeout)
  end.

init() ->
  loop([]).

loop(Cats) ->
  receive
    {Pid, Ref, {order, Name, Color, Description}} ->
      if Cats =:= [] ->
           Pid ! {Ref, make_cat(Name, Color, Description)},
           loop(Cats);
         Cats =/= [] ->
           Pid ! {Ref, hd(Cats)},
           loop(tl(Cats))
      end;
    {return, Cat = #cat{}} ->
      loop([Cat|Cats]);
    {Pid, Ref, terminate} ->
      Pid ! {Ref, ok},
      terminate(Cats);
    Unknown ->
      id:format("Unknown message: ~p~n", [Unknown]),
      loop(Cats)
  end.

  make_cat(Name, Col, Desc) ->
    #cat{name=Name, color=Col, description=Desc}.

  terminate(Cats) ->
    [io:format("~p was set free.~n", [C#cat.name]) || C <- Cats],
    ok.
