%%%-------------------------------------------------------------------
%%% @author mikhail
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. май 2021 16:04
%%%-------------------------------------------------------------------
-module(collector).
-author("mikhail").

%% API
-export([main/0, collector/0, run/0, init/0]).

-import(common, [send/2, quoted/1, cookie/0, start/0, rand/1, rand/2]).

name() -> collector.


collector() ->
  log:say("collector waiting for check"),
  receive
    {From, Check} ->
      log:sayEx(["collector get check for ", quoted(Check)]),
      N = rand(500),
      if
        N >= 250 -> Res = "alive";
        true -> Res = "dead"
      end,
      send(accumulator, {From, quoted(Check) ++ " is " ++ Res})
  end, collector().

%%main() -> Collector_PID = spawn(fun() ->
%%  erlang:set_cookie(node(), cookie()),
%%  common:start(),
%%  collector() end),
%%  global:register_name(name(), Collector_PID),
%%  common:nop(self()).

main() ->
  common:start(),
  Pid = spawn(?MODULE, collector, []),
  register( collector, Pid ),
  io:format("server started with pid (~p)~n", [Pid] ),
  noop.

run() ->
  register(collector, spawn(?MODULE, main, [])).
init() ->
  collector().