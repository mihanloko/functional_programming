%%%-------------------------------------------------------------------
%%% @author mikhail
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. май 2021 15:45
%%%-------------------------------------------------------------------
-module(core).
-author("mikhail").

%% API
-export([main/0, core/0, run/0, init/0]).

-import(common, [send/2, quoted/1, cookie/0, start/0, rand/1, rand/2]).

name() -> core.

checks() -> ["wf", "db", "was"].

core() ->
  log:say("send checks"),
  core(checks()),
  timer:sleep(2000),
  core().

core([Head | Tail]) ->
  send(collector, {Head}),
  core(Tail);
core([]) -> void.


main() -> Core_PID = spawn(fun() ->
  erlang:set_cookie(node(), cookie()),
  log:say("node ~p", [[node()]]),
  log:say("node ~p", [[common:nodes()]]),
  common:start(),
  core() end),
  global:register_name(name(), Core_PID),
  common:nop(self()).


run() ->
  register(core, spawn(?MODULE, init, [])).
init() ->
  core().