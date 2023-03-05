class Cell

  attr_accessor :board, :x, :y

  def initialize(board, x=0, y=0)
  	@board = board
  	@x = x
  	@y = y
  	board.cells << self
  end

  def neighbors
  	
  end

  def create_at(x, y)
  	Cell.new(x, y)
  end

end
