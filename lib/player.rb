class Player
  attr_reader :name,
              :deck

  def initialize(name, deck=nil)
    @name = name
    @deck = deck
    @player_has_lost = false
  end

  def player_has_lost?
    if @deck.cards.length > 0
      @player_has_lost = false
    else
      true
    end
  end

  def inherit_deck(deck)
    @deck = deck
  end
end
