defmodule Diff do
  def readFile(filename) do
    envs = []

    File.open(filename, [:read, :write], fn file ->
      content = IO.read(file, :line)
      [String.split(content, "=") |> Enum.at(0) | envs]
    end)
  end
end
