defmodule TabPlayerTest do
  use ExUnit.Case

  test "Ode to joy, part 1" do
    tab = """
          e|-------------------------------|
          B|-5-5-6-8-8-6-5-3-1-1-3-5-5-3-3-|
          G|-------------------------------|
          D|-------------------------------|
          A|-------------------------------|
          E|-------------------------------|
          """
    expected = "B5 B5 B6 B8 B8 B6 B5 B3 B1 B1 B3 B5 B5 B3 B3"
    assert TabPlayer.parse(tab) == expected
  end

  test "Ode to joy, part 2" do
    tab = """
          e|-------------------------------|
          B|-5-5-6-8-8-6-5-3-1-1-3-5-3-1-1-|
          G|-------------------------------|
          D|-------------------------------|
          A|-------------------------------|
          E|-------------------------------|
          """
    expected = "B5 B5 B6 B8 B8 B6 B5 B3 B1 B1 B3 B5 B3 B1 B1"
    assert TabPlayer.parse(tab) == expected
  end
  
  test "Romanza" do
    tab = """
          e|-7-----7-----7-----7-----5-----3-----3-----2-----0-----0-----|
          B|---0-----0-----0-----0-----0-----0-----0-----0-----0-----0---|
          G|-----0-----0-----0-----0-----0-----0-----0-----0-----0-----0-|
          D|-------------------------------------------------------------|
          A|-------------------------------------------------------------|
          E|-------------------------------------------------------------|
          """
    expected = "e7 B0 G0 e7 B0 G0 e7 B0 G0 e7 B0 G0 e5 B0 G0 e3 B0 G0 e3 B0 G0 e2 B0 G0 e0 B0 G0 e0 B0 G0"
    assert TabPlayer.parse(tab) == expected
  end

  test "Stairway to Heaven part 1" do
    tab = """
          e|-------5-7-----7-|-8-----8-2-----2-|-0---------0-----|-----------------|
          B|-----5-----5-----|---5-------3-----|---1---1-----1---|-0-1-1-----------|
          G|---5---------5---|-----5-------2---|-----2---------2-|-0-2-2-----------|
          D|-7-------6-------|-5-------4-------|-3---------------|-----------------|
          A|-----------------|-----------------|-----------------|-2-0-0---0---8-7-|
          E|-----------------|-----------------|-----------------|-----------------|
          """
    expected = "D7 G5 B5 e5 e7/D6 B5 G5 e7 e8/D5 B5 G5 e8 e2/D4 B3 G2 e2 e0/D3 B1 G2 B1 _ e0 B1 G2 B0/G0/A2 B1/G2/A0 B1/G2/A0 _ A0 _ A8 A7"
    assert TabPlayer.parse(tab) == expected    
  end

  test "Stairway to Heaven part 2" do
    tab = """
          e|-------5-7-----7-|-8-----8-2-----2-|-0---------0-----|-----------------|-----------7-----7-|-8-----8-2-----2-|-0---------0-----|-----------------|
          B|-----5-----5-----|---5-------3-----|---1---1-----1---|-0-1-1-----------|---------5---5-----|---5-------3-----|---1---1-----1---|-0-1-1-----------|
          G|---5---------5---|-----5-------2---|-----2---------2-|-0-2-2-----------|-------5-------5---|-----5-------2---|-----2---------2-|-0-2-2-----------|
          D|-7-------6-------|-5-------4-------|-3---------------|-----------------|-----7-----6-------|-5-------4-------|-3---------------|-----------------|
          A|-----------------|-----------------|-----------------|-2-0-0---0---8-7-|-0-----------------|-----------------|-----------------|-2-0-0-------0-2-|
          E|-----------------|-----------------|-----------------|-----------------|-------------------|-----------------|-----------------|-----------------|
          """
    expected = "D7 G5 B5 e5 e7/D6 B5 G5 e7 e8/D5 B5 G5 e8 e2/D4 B3 G2 e2 e0/D3 B1 G2 B1 _ e0 B1 G2 B0/G0/A2 B1/G2/A0 B1/G2/A0 _ A0 _ A8 A7 A0 _ D7 G5 B5 e7/D6 B5 G5 e7 e8/D5 B5 G5 e8 e2/D4 B3 G2 e2 e0/D3 B1 G2 B1 _ e0 B1 G2 B0/G0/A2 B1/G2/A0 B1/G2/A0 _ _ _ A0 A2"
    assert TabPlayer.parse(tab) == expected    
  end
end
