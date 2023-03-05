class Board

	attr_accessor :cells, :state

	def initialize
		@cells = []
	end

	def nextgen
		cells.each do |cell|
			cell.die 		if cell.neighbours.select{|c| c.alive?}.count < 2 || cell.neighbours.select{|c| c.alive?}.count > 3
			cell.relive if cell.neighbours.count == 3
		end
	end

end