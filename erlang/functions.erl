-module(functions).
-compile(export_all).
-export([head/1,
         second/1]).

head([H|_]) -> H.
second([_,S|_]) -> S.
