defmodule Merge do

  def merge(list1, list2) do
    merge(list1, list2, [])
  end

  defp merge([], [], acc), do: Enum.reverse(acc)

  defp merge([h | t], [], acc), do: merge(t, [], [h | acc])
  defp merge([], [h | t], acc), do: merge([], t, [h| acc])


  defp merge([lh | lt], [rh | rt], acc) when lh < rh do
    merge(lt, [rh | rt], [lh | acc])
  end

  defp merge([lh | lt], [rh | rt], acc) do
    merge([lh | lt], rt, [rh | acc])
  end
end
