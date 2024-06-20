# defines the gamespace that the knight will move in
class Board
  attr_accessor :size, :rows

  def initialize(size = 8)
    @size = size
    @rows = Array.new(size) { (0..(size - 1)).to_a }
  end

  def valid_move?(from, to) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    if (to[0] == from[0] + 1 && to[1] == from[1] + 2) ||
       (to[0] == from[0] + 2 && to[1] == from[1] + 1) ||
       (to[0] == from[0] + 2 && to[1] == from[1] - 1) ||
       (to[0] == from[0] + 1 && to[1] == from[1] - 2) ||
       (to[0] == from[0] - 1 && to[1] == from[1] - 2) ||
       (to[0] == from[0] - 2 && to[1] == from[1] - 1) ||
       (to[0] == from[0] - 2 && to[1] == from[1] + 1) ||
       (to[0] == from[0] - 1 && to[1] == from[1] + 2)
      true
    end
  end

  def on_board?(to)
    true if (0..(size - 1)).include?(to[0]) && (0..(size - 1)).include?(to[1])
  end
end
