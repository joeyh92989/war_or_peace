require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :starting_deck,
              :deck1,
              :deck2
  def initialize
    @starting_deck = []
    @deck1 = []
    @deck2 = []
  end

  def create_starting_deck
    suits = [:Diamond, :Heart, :Spade, :Club]
    values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
    ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]

    ranks_to_values = Hash[ranks.zip(values)]

    suits.each do |suit|
      ranks_to_values.each do |key, value|
          starting_deck << Card.new(suit, value, key)
          return starting_deck
        end
      end
    end
  end
  def method_name

  end
end
