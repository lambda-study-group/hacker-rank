-module(solution).
-export([main/0]).

main() ->
	List = input([]),
    F = fun(A, B) -> case A rem 2 =/= 0 of
                         true -> 
                             A + B;
                         false -> B
                     end
        end,
    io:format("~p~n", [lists:foldl(F, 0, List)]).

input(L) ->
    case io:fread("", "~d") of
        {ok, [N]} -> input([N|L]);
        _ -> lists:reverse(L)
    end.
