require 'byebug'
require './card.rb'

class Board
  attr_reader :cards

  def initialize(cards=nil)
    @cards = cards || Array.new(20)
  end

  def populate
    # debugger
    alphabet = ('a'..'z').to_a.shuffle
    (cards.length).times do |i|
      if i.even?
        cards[i] = Card.new(alphabet.pop)
        cards[i+1] = cards[i]
      end
    end
    cards.shuffle!
  end

  def render(*guessed_pos)
    (0...cards.length).each do |i|
      if guessed_pos.include?(i)
       reveal(i)
       cards[i].display#(guessed_pos)
       hide(i)
     else
       cards[i].display
     end
    end
    nil
  end

  def won?
    cards.all? {|card| card.up_down }
  end

  def reveal(guessed_pos)
    cards[guessed_pos].reveal

    # cards[guessed_pos].display
  end

  def hide(guessed_pos)
    cards[guessed_pos].hide
    # cards[guessed_pos].display
  end


end
