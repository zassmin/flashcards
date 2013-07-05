class FileParsing
 + def open_file
 + def read_file
 + def parse_file
 + def create_flashcard


class FlashCard
 + def initialize
  +  @term
  +  @definition

class Deck
 + def add_flashcard_to_deck

class GameController
+  def create_game
    @deck = Deck.new # => [Card Objects] or { Card Objects }
+  def grab_card
    @card = <Card Object from @Deck>
+  def check_guess
  # def grab_card_until_deck_complete

class GameView
+  def display_card_definition
+  def accept_guess
+  def display_response_to_answer


# DRIVER CODE
GameController.new

