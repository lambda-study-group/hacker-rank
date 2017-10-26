-module(machad0).
-export([main/0]).

helloWorldNTimes(0) -> ok;

helloWorldNTimes(N)
    when N > 0 ->
        io:format("~s~n", ["Hello World!"]),
        helloWorldNTimes(N-1).

main() ->
    {ok, [N]} = io:fread("Repetitions: ", "~d"),
    helloWorldNTimes(N).
