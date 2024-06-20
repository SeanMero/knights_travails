require_relative "board"

# used to make a graph of possible knight moves
class Node < Board
  attr_accessor :value, :move1, :move2, :move3, :move4, :move5, :move6, :move7, :move8

  # value is a an array of 2 ingegers such as [2, 3] denoting a position on a 2-dimensional board
  def initialize(value) # rubocop:disable Lint/MissingSuper,Metrics/AbcSize
    @value = value
    @move1 = [value[0] + 1, value[1] + 2]
    @move2 = [value[0] + 2, value[1] + 1]
    @move3 = [value[0] + 2, value[1] - 1]
    @move4 = [value[0] + 1, value[1] - 2]
    @move5 = [value[0] - 1, value[1] - 2]
    @move6 = [value[0] - 2, value[1] - 1]
    @move7 = [value[0] - 2, value[1] + 1]
    @move8 = [value[0] - 1, value[1] + 2]
  end

  def auto_move(bucket = []) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    # generate all 8 possible next moves
    bucket.push(Node.new(move1)) if on_board?(move1)
    bucket.push(Node.new(move2)) if on_board?(move2)
    bucket.push(Node.new(move3)) if on_board?(move3)
    bucket.push(Node.new(move4)) if on_board?(move4)
    bucket.push(Node.new(move5)) if on_board?(move5)
    bucket.push(Node.new(move6)) if on_board?(move6)
    bucket.push(Node.new(move7)) if on_board?(move7)
    bucket.push(Node.new(move8)) if on_board?(move8)

    # recurse until the whold board is touched, hopefully
    bucket.each { |elem| auto_move(elem) } unless bucket.include?(elem.value)
  end

  include Comparable

  def <=>(other)
    value <=> other.value
  end
end
