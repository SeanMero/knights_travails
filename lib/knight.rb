require_relative "board"

# generates a knight with a position and a certain movement capability
class Knight < Board
  attr_accessor :position

  def initialize(position = [0, 0])
    @position = position
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

  def move(to, from = position)
    @position = to if valid_move?(from, to) && on_board?(to)
  end
end
