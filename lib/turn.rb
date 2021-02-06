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
    @type = ()
  end

  def type
#     type: a turn is :basic, :war, or :mutually_assured_destruction.
# A :basic turn is one in which the rank_of_card_at(0) from the players’ decks are not the same rank.
# A :war turn occurs when both players’ rank_of_card_at(0) are the same.
# :mutually_assured_destruction occurs when both players’ rank_of_card_at(0) AND rank_of_card_at(2) are the same.
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @type = :war
    end
  end

  def winner
#     winner: this method will determine the winner of the turn.
# if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
# if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
# if the turn has a type of :mutually_assured_destruction the method will return No Winner.
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        winner = player1
      else
        winner = player2
      end
    else @type == :war
     if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
       winner = player1
     else
       winner = player2
      end
    end
  end

  def pile_cards
    @spoils_of_war << @player1.deck.cards[0]
    @player1.deck.remove_card
    @spoils_of_war << @player2.deck.cards[0]
    @player2.deck.remove_card
  end

  def award_spoils(player)
    @spoils_of_war.each do |spoils|
      player.deck.cards << spoils
    end
  end
end
