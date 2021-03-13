-module(lab2).
-author("mikhail").

%% API
-export([main/0, sort/1]).

sort(List) ->
  {Status, SortedList} = do_sort(List),
  sort(Status, SortedList).
sort(changed, List) -> sort(List);
sort(unchanged, List) -> List.

do_sort([]) -> {unchanged, []};
do_sort([Last]) -> {unchanged, [Last]};
do_sort([First, Second | Tail]) when First =< Second ->
  {Status, List} = do_sort([Second | Tail]),
  {Status, [First | List]};
do_sort([First, Second | Tail]) ->
  {Status, List} = do_sort([First | Tail]),
  {changed, [Second | List]}.

main() ->
  io:write(sort([6, 4, 5, 1, 3, 8])),
  io:nl(),
  io:write(sort([1, 2, 3, 4, 5, 6])),
  io:nl(),
  io:write(sort([7, 6, 5, 4, 3, 2])),
  io:nl(),
  io:write(sort([])),
  io:nl(),
  io:write(sort([1])),
  io:nl(),
  io:write(sort([5, 5, 3, 3, 1, 1])).