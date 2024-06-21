require_relative "board"

# generates a knight with a position and a certain movement capability
class Knight < Board
  attr_accessor :position, :root

  def initialize(value = [0, 0])
    @position = Node.new(value)
    @root = position.automove
  end

  def move(to, from = position.value)
    @position = Node.new(to) if valid_move?(from, to) && on_board?(to)
  end

  def move_depth(node, answer = [])
    unless node.parent.nil?
      answer.push(node.parent)
      move_depth(node.parent, answer)
    end
    puts "You made it in #{answer.size} moves! Here's your path: #{node} #{answer}"
  end

  def knight_moves(from, to)
    # level-order search of tree for first "to", then get height of that node
    bucket = [from]
    while bucket.length.positive?
      if bucket[0].value == to
        return move_depth(bucket[0])
      else
        bucket.push(bucket[0].sub1) unless bucket[0].sub1.nil?
        bucket.push(bucket[0].sub2) unless bucket[0].sub2.nil?
        bucket.push(bucket[0].sub3) unless bucket[0].sub3.nil?
        bucket.push(bucket[0].sub4) unless bucket[0].sub4.nil?
        bucket.push(bucket[0].sub5) unless bucket[0].sub5.nil?
        bucket.push(bucket[0].sub6) unless bucket[0].sub6.nil?
        bucket.push(bucket[0].sub7) unless bucket[0].sub7.nil?
        bucket.push(bucket[0].sub8) unless bucket[0].sub8.nil?
        bucket.shift
      end
    end
    # below should never happen
    puts "The knight cannot reach #{to} from #{from}"
  end
end
