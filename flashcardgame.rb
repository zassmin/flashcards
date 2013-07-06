module FileParsing

  def read_file
    file_data = []
    File.open('flash_samples.txt', "r") do |object|
      while row = object.gets
        next if row.nil?
        row = row.chomp
        file_data << row
      end
    end 
    file_data
  end

  def parse_data(file_data)
    file_data.reject {|row| row == " " }.each_slice(2).map(&:reverse)
  end
end

class FlashCard

  attr_reader :term, :definition

  def initialize(term, definition)
    @term = term
    @definition = definition
  end

end

class Deck

  include FileParsing

  attr_accessor :flashcards
  # private :flashcards

  def initialize
    @flashcards = []
  end

  # refactor to use Struct??
  def fill_flashcards
    raw_file_array = read_file
    parse_data(raw_file_array).each do |flashcard_array|
      add_flashcard(FlashCard.new(flashcard_array[0],flashcard_array[1]))
    end
  end

  def add_flashcard(flashcard)
    flashcards << flashcard
  end

end

module GameView
  attr_accessor :gameview_guess

  def initialize
    @gameview_guess = ''
  end

  def display(str)
    puts "#{str}"
  end

  def input_guess
    puts "Guess the term:"
    @gameview_guess = gets.chomp
  end

  def correct_answer
    puts "Correct!"
  end

  def incorrect_answer
    puts "Incorrect!"
  end

end


class GameController
  include GameView

  attr_accessor :deck, :graveyard_deck
  
  def initialize
    super
    @graveyard_deck = []
  end

  def create_game
    @deck = Deck.new
    deck.fill_flashcards
  end

  def remove_card
    graveyard_deck << deck.flashcards.shift
  end

  def start_game
    @current_card = deck.flashcards.sample
    definition = @current_card.definition
    display(definition)
    input_guess
    check_guess(gameview_guess)
    remove_card
  end

  def check_guess(guess)
    until gameview_guess == @current_card.term
      incorrect_answer
      input_guess
    end 
    correct_answer
  end
end

learn_programming = GameController.new
learn_programming.create_game
# p learn_programming.grab_card
# p learn_programming.graveyard_deck
learn_programming.start_game
