-module(recursion).
-compile(export_all).
-export([len/1,
         fac/1,
         tail_fac/1,
         tail_len/1,
         lenient_zip/2,
         tail_lenient_zip/2]).


fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).

tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).

len([]) -> 0;
len([_|T]) -> 1 + len(T).

tail_len(L) -> tail_len(L,0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T,Acc+1).

lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs], [Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].

tail_lenient_zip(X,Y) -> tail_lenient_zip(X,Y,[]).

tail_lenient_zip([],_,Acc) -> lists:reverse(Acc);
tail_lenient_zip(_,[],Acc) -> lists:reverse(Acc);
tail_lenient_zip([X|Xs], [Y|Ys], Acc) -> tail_lenient_zip(Xs,Ys,[{X,Y}|Acc]).
