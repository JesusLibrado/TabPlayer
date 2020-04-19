defmodule TabPlayer do
  def parse(tab) do
    newTab = tab 
      |> String.split("\n")
      |> Enum.map(fn string -> TabPlayer.deleteFrets(string) end)
      |> Enum.filter(fn string -> TabPlayer.areAllSilent(string) end)
      |> List.flatten()
      |> Enum.join(" ")

  end

  def areAllSilent(string) do
    Enum.all?(string, fn noteAtFret -> noteAtFret != "-" end)
  end

  def concatenatedNote(note, stringName) do
    if note == "-", do: note, else: stringName <> note
  end

  def deleteFrets(string) do
    stringName = String.at(string, 0)
    string 
      |> String.slice(2, String.length(string))
      |> String.graphemes()
      |> Enum.drop_every(2)
      |> List.delete("|")
      |> Enum.map(fn noteAtFret -> concatenatedNote(noteAtFret, stringName) end)
      
  end

  def addNote(notes, stringName, fret) do
    if Regex.match?(~r/\d/, fret) do
      notes ++ ["#{stringName}#{fret}"]
    else
      notes
    end
  end
end