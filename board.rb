class Board

	attr_accessor :cells

	def initialize
		@cells = []
	end

	def nextgen
		cells.each do |cell|
			cell.die 		if cell.neighbours.count < 2 || cell.neighbours.count > 3
			cell.relive if cell.neighbours.count == 3
		end
	end

end