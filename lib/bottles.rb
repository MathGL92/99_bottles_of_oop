class Bottles
  def song
    verses(99, 0)
  end

  def verses(num_start, num_end)
    num_start.downto(num_end).map { |num| verse(num) }.join("\n")
  end

  def verse(num)
    bottle_number = BottleNumber.new(num)
    next_bottle_number = BottleNumber.new(bottle_number.successor)

    "#{bottle_number} of beer on the wall,".capitalize +
      " #{bottle_number} of beer.\n" \
      "#{bottle_number.action}," \
      " #{next_bottle_number} of beer on the wall.\n"
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
    if number.zero?
      99
    else
      number - 1
    end
  end

  def action
    if number.zero?
      'Go to the store and buy some more'
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def quantity
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end
end
