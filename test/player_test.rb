require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'


class PlayerTest < MiniTest::Test
  def test_player_exists

  card1 = Card.new(:diamond,'Queen', 12)
  card2 = Card.new(:spade,'3', 3)
  card3 = Card.new(:heart, 'Ace', 14)

  deck = Deck.new([card1,card2,card3])

  @player = Player.new('Clarisa',deck)
#require 'pry'; binding.pry
    assert_instance_of Player, @player
  end

  def test_player_has_lost?

    card1 = Card.new(:diamond,'Queen',12)
    card2 = Card.new(:space, '3',3)
    card3 = Card.new(:heart,'Ace',14)

    deck = Deck.new([card1, card2, card3])

    @player = Player.new('Clarisa',deck)

    assert_equal false, @player.player_has_lost?
  end

  def test_player_deck_remove_card
    card1 = Card.new(:diamond, 'Queen',12)
    card2 = Card.new(:space, '3',3)
    card3 = Card.new(:heart, 'Ace',14)

    deck = Deck.new([card1, card2, card3])

    @player = Player.new('Clarisa',deck)

  #  require 'pry'; binding.pry
    assert_equal card1, @player.deck.remove_card
  end

  
end
