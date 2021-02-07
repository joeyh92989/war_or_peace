require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class ObjectTest < MiniTest::Test

  def test_game_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_game_has_attributes
    game = Game.new

    assert_equal [], game.starting_deck
    assert_equal [], game.deck1
    assert_equal [], game.deck2
  end

  def test_create_starting_deck
    game = Game.new
    game.create_starting_deck
    starting_deck = game.create_starting_deck

    # require 'pry'; binding.pry

    assert_equal starting_deck, game.starting_deck
  end

  def test_shuffle_deck

    game = Game.new
    game.create_starting_deck
    game.starting_deck

    assert_equal
  end
end
