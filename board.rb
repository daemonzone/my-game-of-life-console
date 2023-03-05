class Board

	attr_accessor :cells

	def initialize
		@cells = []
	end

	def nextgen
		cells.each do |cell|
			cell.die if cell.neighbours.count < 2
		end
	end

end