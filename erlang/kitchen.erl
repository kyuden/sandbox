-module(kitchen).
-compile(export_all).

fringe1(FoodList) ->
  receive
    {From, {store, Food}} ->
      From ! {self(), ok},
      fringe1([Food|FoodList]);
    {From, {take, Food}} ->
      case lists:member(Food, FoodList) of
        true ->
          From ! {self(), {ok, Food}},
          fringe1(lists:delete(Food, FoodList));

        false ->
          From ! {self(), not_found},
          fringe1(FoodList)
      end;
    terminate ->
      ok
  end.


store(Pid, Food) ->
  Pid ! {self(), {store, Food}},
  receive
    {Pid, Msg} -> Msg
  after 3000 ->
    timeout
  end.

take(Pid, Food) ->
  Pid ! {self(), {take, Food}},
  receive
    {Pid, Msg} -> Msg
  after 3000 ->
     timeout
  end.

start(FoodList) ->
  spawn(?MODULE, fringe1, [FoodList]).
