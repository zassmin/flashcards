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
    parse_data(file_data)
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
