-module(calc).
-compile(export_all).

% 16> calc:rpn("3 5 * 5 / 3 -").
% 0.0
% 17> calc:rpn("10 4 3 + 2 * -").
% -4

rpn(L) when is_list(L) ->
  [Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " ")),
  Res.

rpn("+", [N1, N2|Stack]) -> [(N2+N1)|Stack];
rpn("-", [N1, N2|Stack]) -> [(N2-N1)|Stack];
rpn("*", [N1, N2|Stack]) -> [(N2*N1)|Stack];
rpn("/", [N1, N2|Stack]) -> [(N2/N1)|Stack];
rpn(X, Stack) -> [read(X)|Stack].

read(N) ->
  case string:to_float(N) of
    {error, no_float} -> list_to_integer(N);
    {F, _} -> F
  end.
