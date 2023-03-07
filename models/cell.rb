class Cell

  attr_accessor :board, :x, :y, :state

  def initialize(board, x=0, y=0, state=self.alive)
  	@board = board
  	@x = x
  	@y = y
  	@state = state
  	board.cells << self
  end

  def neighbours
  	@neighbours = []
  	board.cells.select{|cell| cell.alive?}.each do |cell|
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

  def create_at(x, y, state=self.alive)
  	Cell.new(board, x, y, state)
  end

  def die
  	 # board.cells -= [self]
  	 self.state = self.dead
  end

  def relive
  	# board.cells << self
  	self.state = self.alive
  end

	# the population state (* represents a live cell, . represents a dead cell)
  def dead?
  	# !board.cells.include?(self)
  	self.state == self.dead
  end

  def alive?
  	# board.cells.include?(self)
  	self.state == self.alive
  end

  def alive
  	'*'
  end

  def dead
  	'.'
  end
end
