require './lib/card'
require './lib/deck'

class CreateDeck
  attr_reader :suits,
              :values,
              :ranks,
              :starting_deck,
              :deck1,
              :deck2
  def initialize(suits, values, ranks)
    @suits = suits
    @values = values
    @ranks = ranks
    @starting_deck = []
    @deck1 = []
    @deck2= []
  end

  def create_starting_deck
    ranks_to_values = Hash[@ranks.zip(@values)]
    @suits.each do |suit|
      ranks_to_values.each do |key, value|
          @starting_deck << Card.new(suit, value, key)
      end
    end
    @starting_deck
  end

  def shuffle_deck
    #require 'pry'; binding.pry
     @starting_deck.shuffle!
  end

  def split_deck
  @deck1 = @starting_deck.take(26)
  @deck2 = @starting_deck.drop(26)
  end
end
