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
-export([main/0, accumulator/2]).

-import(common, [send/2, quoted/1, cookie/0, start/0, rand/1, rand/2]).

name() -> accumulator.

accumulator(Data, Size) ->
  log:say("data size ~p", [[Size]]),
  receive
    {CheckResult} ->
      log:say("recieve " ++ quoted(CheckResult)),
      timer:sleep(600),
      if
        Size == 5 -> send(storage, {Data}), timer:sleep(300), accumulator("", 0);
        Size /= 5 -> timer:sleep(300), accumulator(Data ++ " " ++ quoted(CheckResult), Size + 1)
      end,
      ok
  after 5000 -> log:sayEx(["accumulator wait to long"])
  end.


main() -> Accumulator_PID = spawn(fun() ->
  common:start(),
  accumulator("", 0) end),
  global:register_name(name(), Accumulator_PID),
  common:nop(self()).

