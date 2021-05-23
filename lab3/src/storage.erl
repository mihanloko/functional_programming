%%%-------------------------------------------------------------------
%%% @author mikhail
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. май 2021 17:26
%%%-------------------------------------------------------------------
-module(storage).
-author("mikhail").

%% API
-export([main/0, storage/0]).

-import(common, [send/2, quoted/1, cookie/0, start/0, rand/1, rand/2]).

name() -> storage.


storage() ->
  log:say("storage waiting for data"),
  receive
    {Data} ->
      log:say("recieve " ++ quoted(Data))
  after 5000 -> log:sayEx(["storage wait to long"])
  end, storage().

main() -> Storage_PID = spawn(fun() ->
  erlang:set_cookie(node(), cookie()),
  common:start(),
  storage() end),
  global:register_name(name(), Storage_PID),
  common:nop(self()).