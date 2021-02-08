require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class Game
  attr_reader :starting_deck,
              :turn
  def initialize(starting_deck, turn)
    @starting_deck = starting_deck
    @turn = turn
  end

  def start
    distribute_cards
    until turn.player1.player_has_lost? == true ||turn.player2.player_has_lost? == true do
       # require 'pry'; binding.pry
      turn.type
       # require 'pry'; binding.pry
      turn.winner
       # require 'pry'; binding.pry
      turn.pile_cards
      # require 'pry'; binding.pry
      turn.award_spoils(turn.winner)
      # require 'pry'; binding.pry
      if turn.player1.player_has_lost? == true ||turn.player2.player_has_lost? == true
        require 'pry'; binding.pry
        if turn.player.player_has_lost? == true
          puts "#{player2.name}"
        else
          puts "#{player1.name}"
        end
      end
    end
  end

  def distribute_cards
    @starting_deck.create_starting_deck
    #require 'pry'; binding.pry
    @starting_deck.shuffle_deck
    #require 'pry'; binding.pry
    @starting_deck.split_deck
    deck1 = Deck.new(@starting_deck.deck1)
    @turn.player1.inherit_deck(deck1)
    deck2 = Deck.new(@starting_deck.deck2)
    @turn.player2.inherit_deck(deck2)
  end
end
