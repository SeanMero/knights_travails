require_relative "board"

# used to make a graph of possible knight moves
class Node < Board
  attr_accessor :value, :parent, :move1, :move2, :move3, :move4, :move5, :move6, :move7, :move8, :sub1, :sub2, :sub3,
                :sub4, :sub5, :sub6, :sub7, :sub8

  # value is a an array of 2 ingegers such as [2, 3] denoting a position on a 2-dimensional board
  def initialize(value, parent = nil) # rubocop:disable Lint/MissingSuper,Metrics/AbcSize,Metrics/MethodLength
    @value = value
    @parent = parent
    @move1 = [value[0] + 1, value[1] + 2]
    @move2 = [value[0] + 2, value[1] + 1]
    @move3 = [value[0] + 2, value[1] - 1]
    @move4 = [value[0] + 1, value[1] - 2]
    @move5 = [value[0] - 1, value[1] - 2]
    @move6 = [value[0] - 2, value[1] - 1]
    @move7 = [value[0] - 2, value[1] + 1]
    @move8 = [value[0] - 1, value[1] + 2]
    @sub1 = nil
    @sub2 = nil
    @sub3 = nil
    @sub4 = nil
    @sub5 = nil
    @sub6 = nil
    @sub7 = nil
    @sub8 = nil
  end

  def link_node?(node, bucket)
    true if on_board?(node.value) && bucket.all? { |elem| elem.value != node.value }
  end

  def auto_move(bucket = []) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity,Metrics/MethodLength
    # generate all 8 possible next moves
    a = Node.new(move1, self)
    b = Node.new(move2, self)
    c = Node.new(move3, self)
    d = Node.new(move4, self)
    e = Node.new(move5, self)
    f = Node.new(move6, self)
    g = Node.new(move7, self)
    h = Node.new(move8, self)

    if link_node?(a, bucket)
      @sub1 = a
      bucket.push(sub1)
    end

    if link_node?(b, bucket)
      @sub2 = b
      bucket.push(sub2)
    end

    if link_node?(c, bucket)
      @sub3 = c
      bucket.push(sub3)
    end

    if link_node?(d, bucket)
      @sub4 = d
      bucket.push(sub4)
    end

    if link_node?(e, bucket)
      @sub5 = e
      bucket.push(sub5)
    end

    if link_node?(f, bucket)
      @sub6 = f
      bucket.push(sub6)
    end

    if link_node?(g, bucket)
      @sub7 = g
      bucket.push(sub7)
    end

    if link_node?(h, bucket)
      @sub8 = h
      bucket.push(sub8)
    end

    while bucket.size.positive?
      bucket[0].auto_move(bucket)
      bucket.shift
    end
  end
end
