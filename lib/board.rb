# Boardgame class
class Board
  BODY_PARTS = ['O', '|', '/', '\\', '/', '\\'].freeze
  WORDS = %w(GENETIC BOOGIE SQUASH QUARTER HANGMAN CONTRADICTION FRIEND EMPLOYEE
             CHERRY ANNUAL FAVORABLE SENSATIONAL MOTHER BUFFET BUFFER STUDIO
             PERFUME FRAGRANT FRAGILE ACCOMPANY GOSSIP INSPIRE MOTIVE).freeze

  def initialize
    reset
  end

  def word
    @word.join
  end

  def reset
    @revealed_body_parts = [' ', ' ', ' ', ' ', ' ', ' ']
    @word = WORDS.sample.chars
    @unknown_word = []
    @word.size.times { @unknown_word << '_' }
  end

  def display
    puts '+--------+'
    puts '|        |'
    puts '|        |'
    puts "|        #{revealed_body_parts[0]}"
    puts "|       #{revealed_body_parts[2]}#{revealed_body_parts[1]}#{revealed_body_parts[3]}"
    puts "|       #{revealed_body_parts[4]} #{revealed_body_parts[5]}"
    puts '|'
    puts '|'
    puts '-'
    puts
    puts "WORD: #{unknown_word.join(' ')}"
    puts
  end

  def hangman?
    revealed_body_parts == BODY_PARTS
  end

  def word_finished?
    unknown_word == @word
  end

  def verify(letter)
    word.include? letter.upcase
  end

  def update_word!(letter)
    indexes = @word.each_index.select { |i| @word[i] == letter.upcase }
    indexes.each { |index| unknown_word[index] = letter.upcase }
  end

  def update_board!(guess_num)
    revealed_body_parts[guess_num] = BODY_PARTS[guess_num]
  end

  private

  attr_reader :revealed_body_parts, :unknown_word
end
