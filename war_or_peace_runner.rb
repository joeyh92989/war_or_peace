require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/create_deck'




puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------
"


suits = [:Diamond, :Heart, :Spade, :Club]
values = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14]
starting_deck = CreateDeck.new(suits,values,ranks)
player1 = Player.new("Aurora")
player2 = Player.new("Megan")
turn = Turn.new(player1, player2)
game = Game.new(starting_deck,turn)



start = gets.chomp.upcase
if start != 'GO'
  puts "try again"
elsif start == 'GO'
game = game.start
end
