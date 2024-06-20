require_relative "board"

# generates a knight with a position and a certain movement capability
class Knight < Board
  attr_accessor :position

  def initialize(position = [0, 0])
    @position = position
  end

  def move(to, from = position)
    @position = to if valid_move?(from, to) && on_board?(to)
  end
end

def knight_moves(from, to)
  # build it like a binary search tree, where each move is a node and each possible move from there is a subtree
  # do breadth search to find success branch with smallest height

  # build graph of possible moves from 'from', then possible moves from those moves
  # for how many steps though?
  start = Node.new(from)
  start.auto_move

end
