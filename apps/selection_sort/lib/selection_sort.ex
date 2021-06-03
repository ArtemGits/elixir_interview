defmodule SelectionSort do
  @moduledoc """
  Documentation for `SelectionSort`.
  """

  @doc """
  """
  def start(data, type) do
    selection_sort(data, type)
  end

  defp selection_sort(data, type) do
    sort(data, [], type)
  end

  defp sort([first | []], acc, _type) do
    acc ++ [first]
  end

  defp sort(list, acc, type) do
    element = selection(list, type)
    sort(:lists.delete(element, list), acc ++ [element], type)
  end

  defp selection([first | []], _type) do
    first
  end

  defp selection([first | [second | tail]], type) do
    element = selection(first, second, type)
    selection([element | tail], type)
  end

  defp selection(first, second, :asc) do
    max(first, second)
  end

  defp selection(first, second, _) do
    min(first, second)
  end
end
