# Player class when the user has chosen to be the BREAKER
class PlayerBreaker
  attr_reader :guess

  def select_pattern
    @guess = Array.new(4)
  end
end

# Player class when the user has chosen to be the MAKER
class PlayerMaker
  attr_reader :pattern

  def select_pattern
    @pattern = gets.chomp
  end
end
