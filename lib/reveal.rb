module Revealable
  def reveal_body
    puts 'Incorrect_guess!'
    board.update_board!(player.incorrect_guesses)
    player.incorrect_guesses += 1
  end

  def reveal_letter
    puts 'You guessed correctly!'
    board.update_word!(player.current_guess)
  end
end
