-module(solution).
-export([main/0]).

main() ->
	List = input([]),
    output(lists:foldl(fun(A, B) -> [A|B] end, [], List)).


input(L) ->
    case io:fread("", "~d") of
        {ok, [N]} -> input([N|L]);
        _ -> lists:reverse(L)
    end.

output(L) -> [io:fwrite("~w~n", [Term]) || Term <- L].