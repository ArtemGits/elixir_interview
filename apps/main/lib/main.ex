defmodule Main do
  @moduledoc """
  Documentation for `Main`.
  """

  @doc """
  """

  def algorithms() do
    [SelectionSort]
  end

  def main do
    data = for _x <- 0..:rand.uniform(50000), do: :rand.uniform(100)

    algorithms()
    |> Enum.map(fn e ->
      Task.start(fn ->
        e.start(data, :asc)
        |> IO.inspect()
      end)
    end)
  end
end
