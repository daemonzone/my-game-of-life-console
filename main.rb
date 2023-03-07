require './models/board.rb'
require './models/cell'

life = Board.new
life.import(ARGV[0])
life.create_life

life.display
while true
  life.nextgen  
  life.display
  sleep 1
end
