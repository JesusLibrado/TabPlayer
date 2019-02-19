defmodule TabPlayer do
  def parse(tab) do
    currentTab = tab |> String.split("\n")
    tabLength = String.length(List.first(currentTab))-1
    getSequenceOfNotes(currentTab, [], 0, 2, tabLength)
  end

  def getNote(head, timerAt) do
   if rem(timerAt, 2) != 0 do
      if is_number(String.at(head, timerAt)), do: String.at(head, 0) <> String.at(head, timerAt)
   end
  end

  def getNoteByTime([_head|_tail], stringAt, timerAt, tabLength, note) when stringAt == 6 do
    note
  end 

  def getNoteByTime([head|tail], stringAt, timerAt, tabLength, note) do
    if String.at(head, timerAt) == "|"  do 
        getNoteByTime(tail, 6, timerAt, tabLength, "")
    end
    getNoteByTime(tail, stringAt+1, timerAt, tabLength, getNote(head, timerAt))
  end

  def getSequenceOfNotes(tab, sequenceList, _stringAt, timerAt, tabLength) when timerAt == tabLength-1 do
    Enum.reverse(sequenceList)
  end

  def getSequenceOfNotes(tab, sequenceList, stringAt, timerAt, tabLength) do
    notePerTime = getNoteByTime(tab, stringAt, timerAt, tabLength, " ")
    List.insert_at(sequenceList, 0, notePerTime)
    getSequenceOfNotes(tab, [], 0, timerAt+1, tabLength)
  end

end