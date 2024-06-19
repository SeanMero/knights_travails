# defines the gamespace that the knight will move in
class Board
  attr_accessor :size, :rows

  def initialize(size = 8)
    @size = size
    @rows = Array.new(size) { (0..(size - 1)).to_a }
  end
end
