require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/card'
require './lib/create_deck'

class CreateDeckTest < MiniTest::Test

  def test_it_exists
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    create_deck = CreateDeck.new(suits, values, ranks)


    assert_instance_of CreateDeck, create_deck
  end

  def test_it_has_attributes
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    create_deck = CreateDeck.new(suits, values, ranks)

    assert_equal suits, create_deck.suits
    assert_equal values, create_deck.values
    assert_equal ranks, create_deck.ranks
  end

  def test_can_create_deck
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    create_deck = CreateDeck.new(suits, values, ranks)


    assert_equal 52, create_deck.create_starting_deck.count
  end

  def test_can_shuffle
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    create_deck = CreateDeck.new(suits, values, ranks)
    unshuffeled_deck= create_deck.create_starting_deck


    assert_equal 52, create_deck.shuffle_deck.count
    refute_equal unshuffeled_deck, create_deck.shuffle_deck
  end

  def test_can_split_deck
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
    create_deck = CreateDeck.new(suits, values, ranks)
    create_deck.create_starting_deck
    create_deck.split_deck

     assert_equal 26, create_deck.deck1.count
     assert_equal 26, create_deck.deck2.count


  end
end
