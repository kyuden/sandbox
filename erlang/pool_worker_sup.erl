-module(pool_worker_sup).
-behavior(supervisor).
-compile(export_all).

start_link(MFA = {_,_,_}) ->
  supervisor:start_link(?MODULE, MFA).

init({M,F,A}) ->
  MaxRestart = 5,
  MaxTime = 3600,
  {ok, {{simple_one_for_one, MaxRestart, MaxTime},
         [{ppool_worker,
           {M,F,A},
           temporary, 5000, worker, [M]}]}}.

