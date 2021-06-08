defmodule CombSort do
  @moduledoc """
  Documentation for `CombSort`.
  """

  @shrink_coef 1.3

  def start(data, type) do
    comb_sort(data, type)
  end

  defp comb_sort(data, type) do
    gap = length(data)
    sort(List.to_tuple(data), gap, type) |> Tuple.to_list()
  end

  defp sort(sorted, gap, _) when gap <= 1, do: sorted

  defp sort(tuple, gap, type) do
    gap = floor(gap / @shrink_coef)

    0..(tuple_size(tuple) - gap - 1)
    |> Enum.reduce(tuple, fn i, acc ->
      fetch_comparable_elems(acc, i, gap)
      |> compare(type)
      |> swap(acc, i, gap)
    end)
    |> sort(gap, type)
  end

  defp fetch_comparable_elems(tuple, index, gap) do
    {elem(tuple, index), elem(tuple, index + gap)}
  end

  defp swap(false, tuple, _, _), do: tuple

  defp swap({e1, e2} = _elems, tuple, i, gap) do
    tuple
    |> put_elem(i, e2)
    |> put_elem(i + gap, e1)
  end

  defp compare({e1, e2}, :asc) when e1 <= e2, do: false
  defp compare({e1, e2}, :desc) when e1 >= e2, do: false
  defp compare({e1, e2}, _type), do: {e1, e2}
end
