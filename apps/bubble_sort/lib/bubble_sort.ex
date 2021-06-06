defmodule BubbleSort do
  @moduledoc """
  Documentation for `BubbleSort`.
  """

  defp pass(bubbled, old, _type) when bubbled == old, do: bubbled

  defp pass(bubbled, old, type) when bubbled != old do
    Enum.reverse(sort(bubbled, [], type))
    |> pass(bubbled, type)
  end

  def start(data, type) do
    bubble_sort(data, type)
  end

  def bubble_sort(data, type) do
    pass(sort(data, [], type), data, type)
  end

  def sort([], _acc, _type) do
    []
  end

  def sort([head | []], acc, _type) do
    [head | acc]
  end

  def sort([first | [second | tail]], acc, type) do
    {new_first, new_second} = swap(first, second, type)
    sort([new_second | tail], [new_first | acc], type)
  end

  defp swap(e1, e2, :asc) when e1 <= e2, do: {e1, e2}
  defp swap(e1, e2, :desc) when e1 >= e2, do: {e1, e2}
  defp swap(e1, e2, _), do: {e2, e1}
end
