defmodule TabPlayer do
  def parse(tab) do
    currentTab = tab |> String.split("\n")
    tabLength = String.length(List.first(currentTab))-1
    getSequenceOfNotes(currentTab, [], 2, tabLength)
  end

  def isValidTimeOrFret(head, timerAt) do
    String.at(head, timerAt) != "|" or rem(timerAt, 2) != 0 
  end

  def getNotesByTime([_head|_tail], sequenceList, stringAt, _timerAt, _tabLength) when stringAt == 6 do
    sequenceList
  end 

  def getNotesByTime([head|tail], sequenceList, stringAt, timerAt, tabLength) do
    if isValidTimeOrFret(head, timerAt) do
      if String.match?(String.at(head, timerAt), ~r/\d/) do
        string = String.at(head, 0)
        fret = String.at(head, timerAt)
        IO.inspect(List.insert_at(sequenceList, 0, "#{string}#{fret}"), label: "Here")
        getNotesByTime(tail, sequenceList, stringAt + 1, timerAt, tabLength)
      end
      getNotesByTime(tail, sequenceList, stringAt + 1, timerAt, tabLength)
    end
  end

  def getSequenceOfNotes(_tab, sequenceList, timerAt, tabLength) when timerAt == tabLength-1 do
    Enum.reverse(sequenceList)
  end

  def getSequenceOfNotes(tab, sequenceList, timerAt, tabLength) do
    IO.inspect(sequenceList, label: "List")
    sequenceList = getNotesByTime(tab, sequenceList, 0, timerAt, tabLength)
    getSequenceOfNotes(tab, sequenceList, timerAt+1, tabLength)
  end

end