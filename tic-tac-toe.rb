
require 'pry'

class Board

  def initialize(m,n)
    @row = n
    @column = m
  end



end


###### Workbench ######
def display_board(board)
  puts "#{board[0]}|#{board[1]}|#{board[2]}"
  puts "#{board[3]}|#{board[4]}|#{board[5]}"
  puts "#{board[6]}|#{board[7]}|#{board[8]}"
  puts
end

def update_board(board, position, value)
  board[position.to_i - 1] = value
  puts "board updated"
end

play = "Y"
count_play = 0

while play == "Y" do
  board_02 = (1..9).to_a
  board_length = board_02.length
  puts "Board 2 : #{board_02} length : #{board_length}"

  value_x = "X"
  value_o = "O"

  
  puts "Player one select either 'X' or 'O' to play with:"
  player_one = gets.chomp
  player_one.upcase!
  player_two = value_x

  player_one == value_x ? (player_two = value_o) : (player_two = value_x)

  puts "Player one you selected #{player_one}"
  puts "Player two you get #{player_two}"

  while count_play < board_length do
    count_play += 1
    print "Count play : #{count_play} "
  end
  
  puts
  puts "Select position (1,2,3 etc.) of knot or cross based on the grid numbers below:"
  # puts "1|2|3"
  # puts "4|5|6"
  # puts "7|8|9"

  display_board(board_02)
  puts
  puts "Lets begin!"
  puts

  # game loop starts here
  puts "Player one enter position"
  position_01 = gets.chomp

  p position_01
  
  # # update array
  update_board(board_02, position_01, player_one)
  # board_02[position_01.to_i - 1] = player_one
  puts "Board 2 : #{board_02}"
  # # display position
  display_board(board_02)

  puts
  puts "Player two enter position"
  position_02 = gets.chomp
  p position_02
  board_02[position_02.to_i - 1] = player_two
  puts "Board 2 : #{board_02}"
  # # display position
  display_board(board_02)

  puts "Player one enter position"
  position_01 = gets.chomp

  p position_01
  board_02[position_01.to_i - 1] = player_one
  # # update array
  puts "Board 2 : #{board_02}"
  # # display position
  display_board(board_02)

  puts
  puts "Player two enter position"
  position_02 = gets.chomp
  p position_02
  board_02[position_02.to_i - 1] = player_two
  puts "Board 2 : #{board_02}"
  # # display position
  display_board(board_02)

  puts "Player one enter position"
  position_01 = gets.chomp

  p position_01
  board_02[position_01.to_i - 1] = player_one
  # # update array
  puts "Board 2 : #{board_02}"
  # # display position
  display_board(board_02)

  puts
  puts "Player two enter position"
  position_02 = gets.chomp
  p position_02
  board_02[position_02.to_i - 1] = player_two
  puts "Board 2 : #{board_02}"
  # # display position
  display_board(board_02)

  # puts "Player one enter position"
  # position_01 = gets.chomp
  # # update array
  # # display position

  # puts "Player two enter position"
  # position_02 = gets.chomp
  # # update array
  # # display position

  # puts "Player one enter position"
  # position_01 = gets.chomp
  # # update array
  # # display position

  # puts "Player two enter position"
  # position_02 = gets.chomp
  # # update array
  # # display position


  puts "Play Again?(Y/N):"
  play = gets.chomp
  play.upcase!
  play == 'Y'? (puts "resume play") : play = 'N'
end 


# setup board and players
# board = []
# 9.times {board.push("")} 
# puts "Board 1: #{board}"



