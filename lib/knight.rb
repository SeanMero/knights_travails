# generates a knight with a position and a certain movement capability
class Knight
  attr_accessor :position

  def initialize(position = [0,0])
    @position = position
  end
end
