defmodule BinarySearch do
  @moduledoc """
  Documentation for `BinarySearch`.
  """

  @doc """
  """

  @spec binary_search(tuple, integer) :: {:ok, integer} | :not_found
  def binary_search({}, _key), do: :not_found

  def bianry_search(tuple, key) do
    binary_search(tuple, key, 0, tuple_size(tuple))
  end

  def binary_search(tuple, key, low, high) do
    mid_index = div(low + high, 2)

    case elem(tuple, mid_index) do
      ^key -> {:ok, mid_index}
      element when element > key -> binary_search(tuple, key, low, mid_index - 1)
      element when element < key -> binary_search(tuple, key, mid_index + 1, high)
    end
  end
end
