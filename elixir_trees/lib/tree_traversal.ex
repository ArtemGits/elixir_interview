defmodule ElixirTrees.TreeTraversal do
  alias ElixirTrees.Tree

  @type traverse() :: :dfs | :bfs
  @type tree() :: Tree.t()
  @type history() :: [any]
  @type result() :: {:continue, any} | {:stop, any}
  # what is this?
  @type operation() :: (any, any, history -> result)
  @type stack() :: [tree] | []
  @type queue() :: :queue.queue()
  @type collection() :: stack | queue

  @spec dfs(stack, operation, history) :: history

  # what is this?
  defp dfs(stack, operation, history)

  defp dfs([], _, history), do: history

  defp dfs([%Tree{value: value, key: key, children: children} | stack], operation, history) do
    next(&dfs/3, stack, value, key, children, operation, history)
  end

  @spec next(function, collection, any, any, [tree], operation, history) :: history
  defp next(named_function, collection, value, key, children, operation, history) do
    case apply_operation(operation, value, key, history) do
      {:stop, res} ->
        [res | history]

      {:continue, res} ->
        children
        |> Enum.reduce(collection, fn tree, acc -> tree_insert(acc, tree) end)
        |> named_function.(operation, [res | history])
    end
  end

  @spec bfs(queue, operation, history) :: history

  defp bfs(queue, operation, history)

  defp bfs({[], []}, _, history), do: history

  defp bfs(queue, operation, history) do
    {{:value, %Tree{value: value, key: key, children: children}}, new_queue} = :queue.out(queue)
    next(&bfs/3, new_queue, value, key, children, operation, history)
  end

  @spec tree_insert(collection, tree) :: collection
  defp tree_insert(collection, tree)

  defp tree_insert(collection, nil), do: collection

  defp tree_insert(stack, tree) when is_list(stack), do: [tree | stack]

  defp tree_insert(queue, tree), do: :queue.in(tree, queue)

  @spec apply_operation(operation, any, any, history) :: result
  defp apply_operation(operation, value, key, history) do
    arity = :erlang.fun_info(operation)[:arity]

    if arity != 3 do
      raise "Error"
    else
      operation.(value, key, history)
    end
  end

  @spec traverse(tree, operation, traverse) :: history

  def traverse(tree, operation, type)

  def traverse(tree, operation, type) do
    case type do
      :dfs ->

        new_stack() |> tree_insert(tree) |> dfs(operation, [])
      :bfs ->
        new_queue() |> tree_insert(tree) |> bfs(operation, [])
        end
  end

  @spec new_stack() :: stack
  defp new_stack, do: []
  @spec new_queue() :: queue
  defp new_queue, do: :queue.new
  
end
