require './lib/card'
require './lib/deck'
require './lib/turn'

class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = :basic
  end

  def type
    @type
  end

  def winner
    winner = player1
  end

  def pile_cards
    @spoils_of_war << @player1.deck.cards[0]
    @spoils_of_war << @player1.deck.cards[2]
  end
end
