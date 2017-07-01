defmodule Solution do

    # print function
    def print(str) do
        IO.puts str
    end
    
    # sum function
    def sum(a, b) do
        a + b
    end
    
    # get integer
    def getInteger() do
        text = IO.gets ""
        {integerValue, _} = Integer.parse text
        integerValue
    end
    
end

firstValue = Solution.getInteger
secondValue = Solution.getInteger

Solution.sum(firstValue, secondValue) |> Solution.print