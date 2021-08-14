require_relative 'player'
require_relative 'computer'

# Main game logic
class Game
  attr_reader :player, :computer, :clues, :guess, :turns

  def initialize
    @computer = ComputerMaker.new
    @clues = Array.new(4)
    @guess = 0
    @turns = 12
  end

  def initialize_copy(source)
    super
    @iv = source.iv.dup
  end

  # def set_player_type
  #   print 'Choose to be a 1 - CODEBREAKER or 2 - CODEMAKER: '
  #   @player = gets.chomp == '1' ? PlayerBreaker.new : PlayerMaker.new
  # end

  def take_guess
    print 'Make a 4digit guess (1-6): '
    @guess = gets.chomp.split('')
  end

  def exact_position
    computer.pattern.each_with_index do |number, index|
      next unless number == guess[index]

      computer.pattern[index] = '*'
      guess[index] = '*'
    end
    print "Exact positions: #{computer.pattern} : #{guess}\n"
  end

  def same_number
    guess.each_index do |index|
      next unless guess[index] != '*' && computer.pattern.include?(guess[index])

      computer.pattern[computer.pattern.find_index(guess[index])] = 'o'
      guess[index] = 'o'
    end
    print "Same numbers: #{computer.pattern} : #{guess}\n"
  end

  def play
    while turns.positive?
      computer.transform_pattern
      take_guess
      temp_pattern = computer.pattern.clone
      print "Guess: #{guess}\n"
      print "Code: #{computer.pattern}\n"
      exact_position
      same_number
      computer.pattern = temp_pattern
      @turns -= 1
    end
  end
end
