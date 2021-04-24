class Bottles
  def initialize; end

  def song
    verses(99, 0)
  end

  def verses(num_start, num_end)
    num_start.downto(num_end).map { |num| verse(num) }.join("\n")
  end

  def verse(num)
    "#{quantity(num).capitalize} #{container(num)} of beer on the wall," \
    " #{quantity(num)} #{container(num)} of beer.\n" \
    "#{action(num)}" \
    "#{quantity(successor(num))} #{container(num - 1)} of beer on the wall.\n"
  end

  private

  def action(num)
    if num.zero?
      'Go to the store and buy some more, '
    else
      "Take #{pronoun(num)} down and pass it around, "
    end
  end

  def successor(num)
    if num.zero?
      99
    else
      num - 1
    end
  end

  def container(num)
    if num == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(num)
    if num == 1
      'it'
    else
      'one'
    end
  end

  def quantity(num)
    if num.zero?
      'no more'
    else
      num.to_s
    end
  end
end
