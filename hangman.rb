Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

# Main game class
class Hangman
  include Displayable, Revealable

  attr_reader :player, :board

  def initialize
    @player = Player.new
    @board = Board.new
  end

  def play
    clear_screen
    display_welcome_message
    player.set_name
    main_game_loop
    display_goodbye_message
  end

  private

  def main_game_loop
    loop do
      clear_screen
      loop do
        board.display
        player.guess!
        clear_screen
        evalulate_guess
        break if won? || lost?
      end
      display_result
      break unless play_again?
      reset_game
    end
  end

  def quit
    puts 'Thanks for playing!'
    exit
  end

  def another_round
    puts 'Enter \'Q\' to quit, other enter any key to keep going.'
    answer = gets.chomp
    quit if answer.downcase == 'q'
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (Y/N)'
      answer = gets.chomp
      break if %w(y n).include? answer
      puts 'Please enter either Y or N.'
    end
    answer == 'y'
  end

  def clear_screen
    system 'clear'
    system 'cls'
  end

  def correct_guess?
    board.verify(player.current_guess)
  end

  def lost?
    board.hangman?
  end

  def won?
    board.word_finished?
  end

  def reset_game
    player.reset
    board.reset
  end

  def evalulate_guess
    correct_guess? ? reveal_letter : reveal_body
  end
end

Hangman.new.play
