defmodule CountingSort do
  @moduledoc """
  Documentation for `CountingSort`.
  """

  @data [5, 4, 1, 3, 8, 1, 9, 0]

  def start(type) do
    counting_sort(@data, type)
  end

  defp counting_sort(data, :desc) do
    counting_sort(data)
  end

  defp counting_sort(data, :asc) do
    counting_sort(data)
    |> Enum.reverse()
  end

  defp counting_sort([]), do: []

  defp counting_sort(data) do
    {min, max} = Enum.min_max(data)
    init_counter = Tuple.duplicate(0, max - min + 1)

    counted =
      Enum.reduce(data, init_counter, fn x, acc ->
        i = x - min
        put_elem(acc, i, elem(acc, i) + 1)
      end)

    insert(min, {min,max}, counted, [])

    # Enum.flat_map(min..max, &List.duplicate(&1, elem(counted, &1 - min)))
  end

  defp insert(i, {min, max} = min_max, counted, sorted) when i <= max do
    i = i - min
    count = elem(counted, i)
    sorted = insert(i, count, sorted)
    insert(i+1, min_max, counted, sorted)
  end

  defp insert(_, _, _, sorted), do: sorted

  defp insert(_i, 0, sorted), do: sorted

  defp insert(i, count, sorted) do
    [i | insert(i, count - 1, sorted)]
  end
end
