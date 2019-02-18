defmodule TabPlayer do
  def parse(tab) do
    newTab = tab 
    |> String.split("\n")
    |> Enum.filter(fn t -> t != "" end)
  end
end