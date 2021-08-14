# Computer class when player is BREAKER
class ComputerMaker
  attr_accessor :pattern

  def initialize
    @pattern = 4.times.map { rand(1..6) }
  end

  def transform_pattern
    @pattern = pattern.map(&:to_s)
  end
end
