defmodule Solution do
    def runFuncNTimes(func, n) when n == 1 do
        func.()
    end
    def runFuncNTimes(func, n) do
        func.()
        runFuncNTimes(func, n - 1)
    end
end

# gets number of times
text = IO.gets ""
{n, _} = Integer.parse(text)

# hello world function definition
helloWorld = fn () -> IO.puts "Hello World" end

# run hello world n times
Solution.runFuncNTimes(helloWorld, n)