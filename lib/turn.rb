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
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2) == player1.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @type = :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      @type = :basic
    end
  end

  def winner
    #     winner: this method will determine the winner of the turn.
    # if the turn has a type of :basic, it will return whichever player has a higher rank_of_card_at(0)
    # if the turn has a type of :war the winner will be whichever player has a higher rank_of_card_at(2)
    # if the turn has a type of :mutually_assured_destruction the method will return No Winner.
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif @type == :mutually_assured_destruction
      p 'No Winner'
    end
  end

  def pile_cards
    #     pile_cards: when this method is called, cards will be sent from the players’ decks into the @spoils_of_war based on these rules
    # for a :basic turn, each player will send one card (the top card) to the spoils pile
    # for a :war turn, each player will send three cards (the top three cards) to the spoils pile
    # for a :mutually_assured_destruction turn, each player will remove three cards from play (the top three cards in their deck). These cards are not sent to the spoils pile, they are simply removed from each players’ deck.
    if @type == :basic
      @spoils_of_war << winner.deck.cards[0]
      winner.deck.remove_card
      @spoils_of_war << @player2.deck.cards[0]
      @player2.deck.remove_card
    elsif @type == :war
      @spoils_of_war << winner.deck.remove_card
      @spoils_of_war << winner.deck.remove_card
      @spoils_of_war << winner.deck.remove_card

    elsif @type == :mutually_assured_destruction
      player1.deck.remove_card
      player1.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoils|
      winner.deck.cards << spoils
    end
  end
end
