class Board

	attr_accessor :cells, :rows, :row_length, :state

	def initialize
		@cells = []
		@rows = rows
		@row_length = 0
	end

	def nextgen
		cells.each do |cell|
			cell.die 		if cell.neighbours.select{|c| c.alive?}.count < 2 || cell.neighbours.select{|c| c.alive?}.count > 3
			cell.relive if cell.neighbours.count == 3
		end

		self
	end

  def board_size
    @rows * @columns
  end

  def chars_valid?(row)
  	row.delete(".*").empty?
  end

  def import(input_file)
    # puts "Importing #{input_file}..."
    unless input_file.nil?
      line_size = 0
      @rows = File.readlines(input_file)
  	  
  	  @rows.each do |row|
		    @row_length = row.strip.length
		  end

		  @rows = @rows.map{ |r| r.strip }
    end # unless input_file.nil?

    @rows
	end

	def create_life
		@row_length = @rows[0].length
	  @rows.each_with_index do |row, idx|
	    raise 'Generation Matrix is not valid' if @row_length != row.strip.length || !chars_valid?(row)

	    row.chars.each_with_index do |c, column|
	    	# print c
	    	# print "\n" if ((column + 1) % @row_length) == 0
	    	Cell.new(self, idx, column, c)
	    end
	  end

	  @cells
	end

  def display
    @cells.each_with_index do |r,idx|
	  	# puts "#{idx} <=> #{@row_length}"
    	print r.state
    	print "\n" if ((idx + 1) % @row_length) == 0
    end
  end	

end