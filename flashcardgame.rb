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

