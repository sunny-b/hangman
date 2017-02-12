module Displayable
  def display_welcome_message
    puts 'Welcome to Hangman!'
    puts 'Guess incorrectly 6 times and you lose!'
    puts 'Lets begin!'
  end

  def display_goodbye_message
    puts 'Thanks for playing! Good bye!'
  end

  def display_result
    board.display
    if won?
      puts "The word is #{board.word}! You won the game!"
      puts
    else
      puts 'Hangman! You lost the game!'
    end
  end
end
