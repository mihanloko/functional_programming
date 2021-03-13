-module(lab2).
-author("mikhail").

%% API
-export([main/0, sort/1, write/1]).

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

write(L) ->
  io:write(L),
  io:nl(),
  io:write(sort(L)),
  io:nl().

main() ->
  write([6, 4, 5, 1, 3, 8]),
  write([1, 2, 3, 4, 5, 6]),
  write([7, 6, 5, 4, 3, 2]),
  write([]),
  write([1]),
  write([5, 5, 3, 3, 1, 1]).