defmodule InsertionSort do
  @moduledoc """
  Documentation for `InsertionSort`.
  """

  @doc """
  """

  def start(data, type) do
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

  def insertion(elem, [head | tail], :asc) when elem <= head do
    insertion(elem, [head | tail])
  end

  def insertion(elem, [head | tail], :desc) when elem >= head do
    insertion(elem, [head | tail])
  end

  def insertion(elem, [head | tail], type) do
    [head | insertion(elem, tail, type)]
  end

  def insertion(elem, [], _) do
    [elem]
  end

  def insertion(elem, [head | tail]), do: [elem | [head | tail]]
end
