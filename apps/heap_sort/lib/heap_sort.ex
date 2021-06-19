defmodule HeapSort do
  @moduledoc """
  Documentation for `HeapSort`.
  """

  @data [4, 1, 5, 1, 6]

  def start(type) do
    heap_sort(@data, type)
  end

  defp heap_sort(data, :asc), do: heap_sort(data)

  defp heap_sort(data, :desc) do
    heap_sort(data) |> Enum.reverse()
  end

  defp heap_sort(data, f_index) when f_index > 0 do
    swap(data, 0, f_index)
    |> sift_down(0, f_index - 1)
    |> heap_sort(f_index - 1)
  end

  defp heap_sort(data, _), do: data

  defp heap_sort(data) do
    tuple = List.to_tuple(data)
    len = tuple_size(tuple)
    start_index = div(len - 2, 2)

    heapify(tuple, start_index)
    |> heap_sort(len - 1)
    |> Tuple.to_list()
  end

  defp heapify(data, s_index) when s_index >= 0 do
    f_index = tuple_size(data) - 1

    sift_down(data, s_index, f_index)
    |> heapify(s_index - 1)
  end

  defp heapify(data, _), do: data

  # ASK the question about guard
  defp sift_down(data, root_i, final_i) when root_i * 2 + 1 <= final_i do
    child_i = get_child_index(data, root_i * 2 + 1, final_i)

    root_e = elem(data, root_i)
    child_e = elem(data, child_i)

    case root_e < child_e do
      true ->
        swap(data, child_i, root_i)
        |> sift_down(child_i, final_i)

      false ->
        data
    end
  end

  defp sift_down(data, _, _), do: data

  defp get_child_index(data, left_child_i, f_index) do
    right_child_i = left_child_i + 1
    left_e = elem(data, left_child_i)
    right_e = elem(data, right_child_i)

    case left_e < right_e and right_child_i <= f_index do
      true ->
        right_child_i

      false ->
        left_child_i
    end
  end

  defp swap(data, i, j) do
    {elem_i, elem_j} = {elem(data, i), elem(data, j)}

    data
    |> put_elem(i, elem_j)
    |> put_elem(j, elem_i)
  end
end
