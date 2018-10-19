defmodule Solution do
    def get_perim do
        n = IO.gets("") |> String.trim() |> String.to_integer()
        points = Enum.map((1..n), &get_points/1)
        shifted_points = Enum.take(points, -(n - 1)) ++ [Enum.at(points, 0)]
        zipped_points = Enum.zip(points, shifted_points)
        Enum.reduce(zipped_points, 0, &reduce_segment_length/2) |> Float.round(7)
    end
    
    defp get_points(_) do
        IO.gets("")
        |> String.trim()
        |> String.split(" ")
        |> Enum.map(&String.to_integer/1)      
    end
    
    defp reduce_segment_length({[x1, y1], [x2, y2]}, acc) do
        a = abs(x1 - x2) |> :math.pow(2)
        b = abs(y1 - y2) |> :math.pow(2)
        segment = a + b |> :math.sqrt()
        segment + acc
    end
end

Solution.get_perim() |> IO.puts()