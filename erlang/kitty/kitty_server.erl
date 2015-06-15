-module(kitty_server).
-compile(export_all).

-record(cat, {name, color=green, description}).

start_link() ->
  my_server:start_link(?MODULE, []).

init([]) -> [].

reply({Pid, Ref}, Reply) ->
  Pid ! {Ref, Reply}.

order_cat(Pid, Name, Color, Description) ->
  my_server:call(Pid, {order, Name, Color, Description}).

close_shop(Pid) ->
  my_server:call(Pid, terminate).

return_cat(Pid, Cat=#cat{}) ->
  my_server:cast(Pid, {return, Cat}).

handle_call({order, Name, Color, Description}, From, Cats) ->
  if Cats =:= [] ->
       my_server:reply(From, make_cat(Name, Color, Description)),
       Cats;
     Cats =/= [] ->
       my_server:reply(From, hd(Cats)),
       tl(Cats)
  end;
handle_call(terminate, From, Cats) ->
  my_server:reply(From, ok),
  terminate(Cats).

handle_cast({return, Cat=#cat{}}, Cats) ->
  [Cat|Cats].

make_cat(Name, Col, Desc) ->
  #cat{name=Name, color=Col, description=Desc}.

terminate(Cats) ->
  [io:format("~p was set free. ~n", [C#cat.name]) || C <- Cats],
  ok.









