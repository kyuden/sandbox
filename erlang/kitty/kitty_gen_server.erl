-module(kitty_gen_server).
-behavior(gen_server).
-compile(export_all).

-record(cat, {name, color=green, description}).

start_link() ->
  gen_server:start_link(?MODULE, [], []).

order_cat(Pid, Name, Color, Description) ->
  gen_server:call(Pid, {order, Name, Color, Description}).

close_shop(Pid) ->
  gen_server:call(Pid, terminate).

return_cat(Pid, Cat=#cat{}) ->
  gen_server:cast(Pid, {return, Cat}).

init([]) -> {ok, []}.

handle_call({order, Name, Color, Description}, _From, Cats) ->
  if Cats =:= [] ->
       {reply, make_cat(Name, Color, Description), Cats};
     Cats =/= [] ->
       {reply, hd(Cats), tl(Cats)}
  end;
handle_call(terminate, _From, Cats) ->
  {stop, normal, ok, Cats}.

handle_cast({return, Cat=#cat{}}, Cats) ->
  {noreply, [Cat|Cats]}.

handle_info(Msg, Cats) ->
  io:format("Unexpexted message: ~p~n", [Msg]),
  [noreply, Cats].

terminate(normal, Cats) ->
  [io:format("~p was set free.~n", [C#cat.name]) || C <- Cats],
  ok.

make_cat(Name, Col, Desc) ->
  #cat{name=Name, color=Col, description=Desc}.

code_change(_Old, State, _Extra) ->
  {ok, State}.

