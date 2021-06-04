defmodule InsertionSort do
  @moduledoc """
  Documentation for `InsertionSort`.
  """

  @doc """
  """

  def main(data, type) do
    insertion_sort(data, type)
  end

  defp insertion_sort(data, type) do
    sort([], data, type)
  end

  defp sort([], [head | tail], type) do
    sort([head], tail, type)
  end

  defp sort(sorted, [head | tail], type) do
    insertion(head, sorted, type)
    |> sort(tail, type)
  end

  defp sort(sorted, [], _type) do
    sorted
  end

  defp insertion(elem, [], _) do
    [elem]
  end

  defp insertion(elem, [head | tail], type) do
    case type do
      :asc ->
        [comparsion(elem, head, elem >= head, tail, type) | [head | tail]]

      :desc ->
        [comparsion(elem, head, elem <= head, tail, type) | [head | tail]]
    end
  end

  defp comparsion(one, two, operation, tail, type) do
    case operation do
      true ->
        one

      false ->
        insertion(two, tail, type)
    end
  end
end
