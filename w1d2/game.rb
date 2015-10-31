require 'byebug'
require './board.rb'
require './card.rb'
require './player.rb'

class Game
  attr_reader :board, :player

  def initialize(player, board = Board.new)
    board.populate
    @board = board
    @player = player
  end


  def play_turn
    pos = player.get_input
    board.render(pos[0], pos[1])
    sleep(2)
    system("clear")

    # board.reveal(pos[0], pos[1])
    if board.cards[pos[0]] == board.cards[pos[1]]
      board.reveal(pos[0])
      board.reveal(pos[1])
    end
    board.render
  end

  def play
    # # if board.cards.any?{|card| card}
    # while !board.won?
    #   temp = []
    #   2.times do |i|
    #     temp[i] = gets.chomp
    #   end
    #   if
    # end
    until board.won?
      play_turn
    end

    puts "You won!"
  end


end


if $PROGRAM_NAME == __FILE__
  player = Human.new
  game = Game.new(player)
  game.play
end
