class Bottles
  def song
    verses(99, 0)
  end

  def verses(num_start, num_end)
    num_start.downto(num_end).map { |num| verse(num) }.join("\n")
  end

  def verse(num)
    bottle_number = BottleNumber.for(num)

    "#{bottle_number} of beer on the wall,".capitalize +
      " #{bottle_number} of beer.\n" \
      "#{bottle_number.action}," \
      " #{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  # def self.for(number)
    # case number
    # when 0
    #   BottleNumber0
    # when 1
    #   BottleNumber1
    # when 6
    #   BottleNumber6
    # else
    #   BottleNumber
    # end.new(number)
  # end

  def self.for(number)
    begin
      const_get("BottleNumber#{number}")
    rescue NameError
      BottleNumber
    end.new(number)
  end

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def successor
    BottleNumber.for(number - 1)
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
    BottleNumber.for(99)
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

class BottleNumber6 < BottleNumber
  def quantity
    1
  end

  def container
    'six-pack'
  end
end
