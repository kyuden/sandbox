-module(guards).
-compile(export_all).
-export([old_enough/1]).

% 2> guards:old_enough(40).
% true
% 3>
% 3> guards:old_enough(10).
% false
old_enough(X) when X >= 20 ->
 true;
old_enough(_) ->
 false.

help_me(Animal) ->
  Talk = if Animal == cat  -> "meow";
            Animal == beef -> "mooo";
            Animal == dog  -> "bark";
            Animal == tree -> "...";
            true -> "fgdadfgda"
         end,
  {Animal, "says " ++ Talk ++ "!"}.

batch(Temperature) ->
  case Temperature of
    {calsius, N} when N > 20, N =< 45 ->
      'favorable';
    {kelvin, N} when N > 293, N =< 318 ->
      'scientifically favarable';
    {fahrenheit, N} when N >= 68, N =< 113 ->
      'favorable in the US';
    _ ->
      'avoid beach'
  end.

