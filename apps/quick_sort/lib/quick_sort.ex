defmodule QuickSort do
  @moduledoc """
  Documentation for `QuickSort`.
  """

  def start(data, type) do
    quick_sort(data, type)
  end

  defp quick_sort(data, :asc) do
    sort(data)
    |> Enum.reverse()
  end

  defp quick_sort(data, :desc) do
    sort(data)
  end

  defp sort([]), do: []
  defp sort([pivot | []]), do: [pivot]

  defp sort([pivot | tail]) do
    {higher_tail, lower_tail} = filter(tail, pivot)
    sort(lower_tail) ++ [pivot] ++ sort(higher_tail)
  end

  defp filter(data, pivot) do
    right = Enum.filter(data, fn e -> e > pivot end)
    left = Enum.filter(data, fn e -> e <= pivot end)
    {left, right}
  end
end
