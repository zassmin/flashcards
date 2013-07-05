module FileParsing

  def read_file
    # return an array of lines
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

  private

  attr_accessor :flashcards

  public

  def initialize
    flashcards = []
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

  def display_card_definition(card)
    puts "#{card.definition}"
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

  attr_accessor :deck
  
  def initialize
    super
  end

  def create_game(deck)
    @deck = deck
  end

  def grab_card
    @graveyard_deck << deck.shift
  end

  def check_guess(guess)
    if guess == @card.term
      correct_answer
    else
      incorrect_answer
      input_guess
    end
  end


end
