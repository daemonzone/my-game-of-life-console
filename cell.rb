class Cell

  attr_accessor :board, :x, :y

  def initialize(board, x=0, y=0)
  	@board = board
  	@x = x
  	@y = y
  	board.cells << self
  end

  def neighbours
  	@neighbours = []
  	board.cells.each do |cell|
  		(@neighbours << cell) if self.x == cell.x + 1 && self.y == cell.y - 1 	 # NW (-1,1)
  		(@neighbours << cell) if self.x == cell.x && self.y == cell.y - 1 			 # N  (0,1)
  		(@neighbours << cell) if self.x == cell.x - 1 && self.y == cell.y - 1 	 # NE (1,1)
  		(@neighbours << cell) if self.x == cell.x - 1 && self.y == cell.y 	 		 # E (1,0)
  		(@neighbours << cell) if self.x == cell.x - 1 && self.y == cell.y + 1 	 # SE (1,-1)
  		(@neighbours << cell) if self.x == cell.x && self.y == cell.y + 1 			 # S  (0,-1)
  		(@neighbours << cell) if self.x == cell.x + 1 && self.y == cell.y + 1 	 # SW (-1,-1)
  		(@neighbours << cell) if self.x == cell.x + 1 && self.y == cell.y 			 # W (-1,0)
  	end
  	
  	@neighbours
  end

  def create_at(x, y)
  	Cell.new(board, x, y)
  end

  def die
  	 board.cells -= [self]
  end

  def dead?
  	!board.cells.include?(self)
  end

  def alive?
  	board.cells.include?(self)
  end

end
