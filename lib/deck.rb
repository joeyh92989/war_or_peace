 class Deck
   attr_reader :cards

  def initialize(cards)
    @cards= cards
    @high_ranking_cards= []
  end

  def rank_of_card_at(index)

    @cards[index].rank
  end

  def high_ranking_cards
    #require 'pry';binding.pry
    @cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    #paired with Joe. This runs, the high ranking cards method, then checks the number of elements in the array, converts the value to a float to allow for decimals. Then divides that by the number of elements in the array to get a percent. Then multiply that by 100 to great a whole number rounding to 2 decimal positions for the answer
    (high_ranking_cards.length.to_f/@cards.length * 100).round (2)
  end

  def remove_card
    @cards.delete_at(0)
  end

  def add_card(card)
    @cards.push(card)
  end
end
