require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/create_deck'

class GameTest < MiniTest::Test

  def test_game_exists
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    starting_deck = CreateDeck.new(suits,values,ranks)
    player1 = Player.new("Aurora")
    player2 = Player.new("Megan")
    turn = Turn.new(player1, player2)
    game = Game.new(starting_deck,turn)
    assert_instance_of Game, game
  end

  def test_game_has_attributes
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    starting_deck = CreateDeck.new(suits,values,ranks)
    player1 = Player.new("Aurora")
    player2 = Player.new("Megan")
    turn = Turn.new(player1, player2)
    game = Game.new(starting_deck,turn)

    assert_equal starting_deck, game.starting_deck
    assert_equal turn, game.turn
  end

  def test_can_distribute_cards
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    starting_deck = CreateDeck.new(suits,values,ranks)
    player1 = Player.new("Aurora")
    player2 = Player.new("Megan")
    turn = Turn.new(player1, player2)
    game = Game.new(starting_deck,turn)

    game.distribute_cards

    assert_equal 26, player1.deck.cards.count
    assert_equal 26, player2.deck.cards.count
  end
end
