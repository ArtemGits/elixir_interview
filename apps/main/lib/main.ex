defmodule Main do
  @moduledoc """
  Documentation for `Main`.
  """

  @doc """
  """

  def algorithms() do
    [SelectionSort, InsertionSort, BubbleSort]
  end

  def main do
    data = for _x <- 0..:rand.uniform(10), do: :rand.uniform(10)

    algorithms()
    |> Enum.map(fn algo ->
      Task.start(fn ->
        algo.start(data, :asc)
        |> print(algo)
      end)
    end)
  end

  defp print(data, algo) do
    IO.inspect("#{inspect(data)} --- #{algo}")
  end
end
