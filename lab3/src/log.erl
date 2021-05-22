%%%-------------------------------------------------------------------
%%% @author mikhail
%%% @copyright (C) 2021, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. май 2021 18:39
%%%-------------------------------------------------------------------
-module(log).
-author("mikhail").

%% API
-export([sayEx/1, say/1, say/2]).

say(Message, [Params]) -> io:format(Message ++ "~n", Params).

-spec log:say(Message) -> true when Message :: string().
say(_Message) -> io:format(string:concat(_Message, "~n")).

-spec log:sayEx(Strings) -> true when Strings :: list().
sayEx(_Strings) -> say(lists:concat(_Strings)).
