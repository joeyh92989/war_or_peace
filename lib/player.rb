class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
    @player_has_lost = false
  end

  def player_has_lost?
    @player_has_lost
  end
end
