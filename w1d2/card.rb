require 'byebug'

class Card
  attr_reader :up_down, :face_value

  def initialize(face_value = nil , up_down = false )
      @up_down = up_down
      @face_value = face_value
  end

  def hide
    @up_down = false
  end

  def reveal
    # debugger
    @up_down = true
  end

  def to_s
    reveal.to_s
  end

  def ==(card)
    face_value == card.face_value
    # self.eql(card)
  end

  def display
    if up_down
     puts face_value
    else
      puts nil
    end
  end
end
