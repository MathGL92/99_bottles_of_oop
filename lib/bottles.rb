class Bottles
  def initialize
  end

  def song
    verses(99, 0)
  end

  def verses(num_start, num_end)
    num_start.downto(num_end).map { |num| verse(num) }.join("\n")
  end

  def verse(num)
    case num
    when 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\nTake one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
    when 1
      "#{num} bottle of beer on the wall, #{num} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\nTake one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end
end
