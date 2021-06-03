defmodule Main do
  @moduledoc """
  Documentation for `Main`.
  """

  @doc """
  """
  @data Enum.to_list(:rand.uniform(100)..:rand.uniform(1_000))

  def algorithms() do
    [SelectionSort]
  end

  def main do
    IO.inspect(@data)

    algorithms()
    |> Enum.map(fn e ->
      Task.async(fn ->
        e.start(@data, :asc)
      end)
      |> Task.await(15000)
    end)
  end
end
