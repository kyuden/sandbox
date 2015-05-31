-module(hhfunc).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X,Y) -> X() + Y().

% 13> hhfunc:map(fun(X) -> X*2 end , [1,2,3,4,5]).
% [2,4,6,8,10]
% 14>
% 14> hhfunc:map(fun(X) -> X*3 end , [1,2,3,4,5]).
% [3,6,9,12,15]
% 15>
% 15> hhfunc:map(fun(X) -> X*4 end , [1,2,3,4,5]).
% [4,8,12,16,20]
% 16>
% 16> hhfunc:map(fun(X) -> X*5 end , [1,2,3,4,5]).
% [5,10,15,20,25]
map(F, L) -> map(F, L, []).

map(_, [], Acc) -> lists:reverse(Acc);
map(F, [X|Y], Acc) -> map(F, Y, [F(X)|Acc]).


% 18> hhfunc:filter(fun(X) -> X rem 2 == 0 end , [1,2,3,4,5]).
% [2,4]
% 19>
% 19> hhfunc:filter(fun(X) -> X rem 3 == 0 end , [1,2,3,4,5]).
% [3]
% 20>
% 20> hhfunc:filter(fun(X) -> X rem 1 == 0 end , [1,2,3,4,5]).
% [1,2,3,4,5]
filter(F, L) -> filter(F, L, []).

filter(_, [], Acc) -> lists:reverse(Acc);
filter(F, [H|T], Acc) ->
  case F(H) of
    true  -> filter(F, T, [H|Acc]);
    false -> filter(F, T, Acc)
  end.

% 22> hhfunc:fold(fun(A,B) when A > B -> A; (_,B) -> B end, [2,3,4,5], 1).
% 5
% 23>
% 23> hhfunc:fold(fun(A,B) when A < B -> A; (_,B) -> B end, [2,3,4,5], 1).
% 1
% 24>
% 24> hhfunc:fold(fun(A,B) when A < B -> A; (_,B) -> B end, [2,3,4,5], 1).
% 1
% 25>
% 25> hhfunc:fold(fun(A,B) -> A + B end, [1,2,3,4,5], 0).
% 15
fold(_, [], S) -> S;
fold(F, [H|T], S) -> fold(F, T, F(H, S)).
