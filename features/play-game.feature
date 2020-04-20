Feature: Play Connect 4
  As a poor Connect 4 player
  I want to play the game on my screen with my friends
  So that I don't need to buy it.


#  Klassen Board constructor start >
#  Metoden ska sätta följande egenskaper till följande värden:
#  game till värdet från inargumentet game.
#  matrix till en array med 6 element. Varje element ska i sin tur vara en array med 7 element, där varje element har värdet 0.
#  currentPlayer till värdet 1.
#  playInProgress till värdet false.
  Scenario: Properties should be set according to the api-specifications
    Given that we create a new Board
    Then property game should get value from the constructor
    And the property matrix should have size six into seven, and zero value at each index
    And the property currentPlayer should have value 1
    And the property playInProgress should have the value false

# Klassen Game start >
# Metoden ska skapa ett ny instans av Board
# och skicka nuvarande instans av Game till dess konstruktor.
# Instansen ska lagras i egenskapen board.
  Scenario: Start the game by calling start method
    Given that we start the game
    Then then new board is created
    And game has its own reference inside the board.

# Klassen Game tell turn >
# om player har värdet 1, byta innehåll till texten “Guls tur…”.
  Scenario Outline: Right player is told to make a move
    Given that game is in progress
    When the player is <player>
    Then it should tell right <message>

    Examples:
      | player |     message |
      |      1 | 'Röds tur…' |
      |      2 | 'Guls tur…' |


# Klassen Game over >
# after game is over there must be right information
  Scenario Outline: When game ends winner must be announced
    When that game is finished
    Then it should tell the <result>

    Examples:
      | won         |              result |
      |          1  |          'Röd vann!' |
      |          2  |          'Gul vann!' |
      |      'draw' | 'Det blev oavgjort!' |



