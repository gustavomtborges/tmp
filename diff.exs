defmodule EnvCompare do
  def diff(origin, target) do
    origin_keys = extract_keys(origin)
    target_keys = extract_keys(target)
    MapSet.difference(MapSet.new(origin_keys), MapSet.new(target_keys))
  end

  defp extract_keys(filename) do
    File.stream!(filename)
    |> Stream.map(&String.split(&1, "="))
    |> Stream.map(&Enum.at(&1, 0))
    |> Enum.to_list()
  end
end
