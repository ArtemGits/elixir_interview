defmodule RadixSort do
  @moduledoc """
  Documentation for `RadixSort`.
  """
 @data [1,553, 1345, 11, 33, 25, 0, 4567, 13, 2,6,7]
  
  def start do
    radix_sort(@data, :asc)
  end

  defp radix_sort(data, :desc) do
    radix_sort(data, :asc)
    |> Enum.reverse()
  end

  defp radix_sort(data, _type) do
    m = Enum.max(data)
    IO.inspect(m)
    sort(data, 1, m)
    
  end

  defp sort(sorted, exp, m) when m/exp > 0 do
    CountingSort.counting_sort1(sorted, exp)
    |> sort(exp * 10, m)
  end

  defp sort(sorted, _, _), do: sorted

  
end
