require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/deck'
require './lib/card'
require './lib/player'

class PlayerTest < MiniTest::Test
  def test_player_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_player_has_lost_starting
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_equal false, player.player_has_lost?
  end

  def test_player_deck_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_equal card1, player.deck.remove_card
  end

  def test_player_can_lose
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    deck.remove_card
    deck.remove_card
    deck.remove_card

    # require 'pry'; binding.pry
    # Good feedback from Kon and Olivia, while i had more assersions they were unnecessary.
    assert_equal true, player.player_has_lost?
    assert_equal [], player.deck.cards
  end

  def test_player_can_take_a_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa')

    assert_equal deck, player.inherit_deck(deck)
  end
end
