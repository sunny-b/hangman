# Player class
class Player
  attr_reader :name, :current_guess, :guesses
  attr_accessor :incorrect_guesses

  def initialize
    reset
  end

  def set_name
    name = nil
    loop do
      puts 'What\'s your name?'
      name = gets.chomp
      break unless name.strip.empty?
      puts 'Please enter a name'
    end
    @name = name
  end

  def reset
    @incorrect_guesses = 0
    @guesses = []
  end

  def guess!
    letter = guess_loop
    @current_guess = letter
    guesses << letter
  end

  private

  def guess_loop
    letter = nil
    loop do
      loop do
        puts "#{name} please pick a letter:"
        letter = gets.downcase.chomp
        break if ('a'..'z').cover? letter
      end
      return letter unless guesses.include? letter
      puts 'You already guessed that letter!'
    end
  end
end
