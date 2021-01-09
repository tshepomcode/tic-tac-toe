
require 'pry'

class Board

  def initialize(m,n)
    @row = n
    @column = m
  end



end


###### Workbench ######

board = []
9.times {board.push("")} 
p board

value_x = "X"
value_o = "O"

puts "Player one select either 'X' or 'O' to play with:"
player_one = gets.chomp
player_one.upcase!
player_two = value_x

player_one == value_x ? (player_two = value_o) : (player_two = value_x)

puts "Player one you selected #{player_one}"
puts "Player two you get #{player_two}"

