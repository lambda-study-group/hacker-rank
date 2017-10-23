-module(solution).
-export([main/0, compress/1, compress/3, input/0]).

main() ->
	String = input(),
    io:format("~s", [compress(String)]).

input() ->
    io:get_line("").

compress(S) ->
    compress(S, 1, []).

compress([], _, Acc) ->
    lists:reverse(Acc);

compress([C], 1, Acc) ->
    compress([], 1, [C | Acc]);

compress([C], Counter, Acc) ->
    compress([], 1, [[C | integer_to_list(Counter)] | Acc]);

compress([C, C | Tail], Counter, Acc) ->
    compress([C | Tail], Counter+1, Acc);

compress([C1, C2 | Tail], 1, Acc) ->
    compress([C2 | Tail], 1, [C1 | Acc]);

compress([C1, C2 | Tail], Counter, Acc) ->
    compress([C2 | Tail], 1, [[C1 | integer_to_list(Counter)] | Acc]).
