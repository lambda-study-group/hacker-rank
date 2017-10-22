-module(machad0).
-export([main/0]).

solveMeFirst(A, B) ->
    A + B.

main() ->
    {ok, [Val1]} = io:fread("First Value: ", "~d"),
    {ok, [Val2]} = io:fread("Second Value ", "~d"),
    Res = solveMeFirst(Val1, Val2),
    io:format("Result: ~p~n",[Res]).
