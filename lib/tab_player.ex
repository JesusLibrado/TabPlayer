defmodule TabPlayer do
  def parse(tab) do
    tab 
      |> String.split("\n")
      |> Enum.map(fn string -> TabPlayer.getFormattedList(string) end)
      |> List.flatten()
      |> List.keysort(1)
      |> Enum.filter(fn {noteAtFret, _position} -> noteAtFret != "-" end)
      |> Enum.map(fn {noteAtFret, _position} -> noteAtFret end)
      |> Enum.join(" ")
      ## |> List.flatten()

  end

  def areAllSilent(string) do
    Enum.all?(string, fn noteAtFret -> noteAtFret != "-" end)
  end

  def concatenatedNote(note, stringName) do
    if note == "-", do: note, else: stringName <> note
  end

  def getFormattedList(string) do
    stringName = String.at(string, 0)
    string 
      |> String.slice(2, String.length(string))
      |> String.graphemes()
      |> Enum.drop_every(2)
      |> List.delete("|")
      |> Enum.map(fn noteAtFret -> concatenatedNote(noteAtFret, stringName) end)
      |> Enum.with_index()
      |> Enum.to_list()
      
  end
end