class Bottles
  def song
    verses(99, 0)
  end

  def verses(num_start, num_end)
    num_start.downto(num_end).map { |num| verse(num) }.join("\n")
  end

  def verse(num)
    bottle_number = bottle_number_for(num)
    next_bottle_number = bottle_number_for(bottle_number.successor)

    "#{bottle_number} of beer on the wall,".capitalize +
      " #{bottle_number} of beer.\n" \
      "#{bottle_number.action}," \
      " #{next_bottle_number} of beer on the wall.\n"
  end

  def bottle_number_for(num)
    case num
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(num)
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def successor
    number - 1
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def container
    'bottles'
  end

  def pronoun
    'one'
  end

  def quantity
    number.to_s
  end
end

class BottleNumber0 < BottleNumber
  def action
    'Go to the store and buy some more'
  end

  def successor
    99
  end

  def quantity
    'no more'
  end
end

class BottleNumber1 < BottleNumber
  def pronoun
    'it'
  end

  def container
    'bottle'
  end
end
