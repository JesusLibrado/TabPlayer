defmodule TabPlayer do
  def parse(tab) do
    tab 
      |> String.split("\n")
      |> Enum.map(fn string -> TabPlayer.getFormattedList(string) end)
      |> List.flatten()
      |> List.keysort(1)
      |> Enum.chunk_every(6)
      |> Enum.map(fn fret -> TabPlayer.getFormattedSilence(fret) end)
      |> Enum.map(fn fret -> TabPlayer.getFormattedChords(fret) end)
      |> List.flatten()
      |> Enum.map(fn {noteAtFret, _position} -> noteAtFret end)
      |> Enum.join(" ")
  end

  def getFormattedChords(fret)  when length(fret) > 1 do
    fretNumber = fret |> List.first() |> elem(1)
    chord = fret 
      |> Enum.filter(fn {noteAtFret, _position} -> noteAtFret != "-" end)
      |> Enum.map(fn {noteAtFret, _position} -> noteAtFret end)
      |> Enum.join("/")
    {chord, fretNumber}
  end

  def getFormattedChords(fret) do
    fret
  end

  def getFormattedSilence(fret) do
    fretNumber = fret |> List.first() |> elem(1)
    if Enum.all?(fret, fn {x, _y} -> x == "-" end) do
      {"_", fretNumber}
    else
      fret
    end
  end

  def concatenatedNote(note, _stringName) when note == "|" or note == "-" do 
    note
  end

  def concatenatedNote(note, stringName) do 
    stringName <> note
  end

  def getFormattedList(string) do
    stringName = String.at(string, 0)
    string 
      |> String.slice(2, String.length(string))
      |> String.trim_trailing("|")
      |> String.graphemes()
      |> Enum.drop_every(2)
      |> Enum.map(fn noteAtFret -> concatenatedNote(noteAtFret, stringName) end)
      |> Enum.filter(fn noteAtFret -> noteAtFret != "|" end)
      |> Enum.with_index(0)
  end
end