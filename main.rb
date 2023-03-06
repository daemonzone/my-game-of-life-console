require './board'
require './cell'

life = Board.new
life.import(ARGV[0])
life.create_life

puts `clear`

life.display

while true
  life.nextgen
  puts `clear`
  life.display
  sleep 1
end
