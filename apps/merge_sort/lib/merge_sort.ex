defmodule MergeSort do
  @moduledoc """
  Documentation for `MergeSort`.
  """

  def start(data, :asc) do
    merge_sort(data)
  end

  def start(data, :desc) do
    merge_sort(data)
    |> Enum.reverse()
  end

  defp merge_sort([]), do: []
  defp merge_sort([head | []]), do: [head]

  defp merge_sort(data) do
    divide_list(data)
    merge_receiver()
  end

  def merge_sort([head | []], parent), do: send(parent, [head])

  def merge_sort(list, parent) do
    divide_list(list)
    send(parent, merge_receiver())
  end

  defp divide_list(data) do
    {left_list, right_list} = Enum.split(data, div(length(data), 2))
    spawn_link(MergeSort, :merge_sort, [left_list, self()])
    spawn_link(MergeSort, :merge_sort, [right_list, self()])
  end

  defp merge_receiver() do
    receive do
      list -> merge(list)
    end
  end

  defp merge(head_list) do
    receive do
      rest_list -> Merge.merge(head_list, rest_list)
    end
  end
end
