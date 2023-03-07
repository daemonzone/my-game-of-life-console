require './models/board'
require './models/cell'

if ARGV.length < 1
  puts "Please, specify an input filename, e.g.: main.rb first_generation.txt"
  exit
end

life = Board.new
life.import(ARGV[0])
life.create_life
life.display

while true
  life.nextgen  
  life.display
  sleep 1
end
