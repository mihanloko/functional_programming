%%%-------------------------------------------------------------------
%%% @author mikhail
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. май 2021 16:20
%%%-------------------------------------------------------------------
-module(accumulator).
-author("mikhail").


%% API
-export([main/0, accumulator/2, run/0, init/0]).

-import(common, [send/2, quoted/1, cookie/0, start/0, rand/1, rand/2]).

name() -> accumulator.

accumulator(Data, Size) ->
  log:say("data size ~p", [[Size]]),
  receive
    {From, CheckResult} ->
      log:say("recieve " ++ quoted(CheckResult)),
      timer:sleep(600),
      if
        Size == 5 -> From ! {Data}, timer:sleep(300), accumulator("", 0);
        Size /= 5 -> timer:sleep(300), accumulator(Data ++ " " ++ quoted(CheckResult), Size + 1)
      end,
      ok
  end.


main() -> Accumulator_PID = spawn(fun() ->
  erlang:set_cookie(node(), cookie()),
  common:start(),
  accumulator("", 0) end),
  global:register_name(name(), Accumulator_PID),
  common:nop(self()).

run() ->
  register(accumulator, spawn(?MODULE, init, [])).
init() ->
  accumulator("", 0).
