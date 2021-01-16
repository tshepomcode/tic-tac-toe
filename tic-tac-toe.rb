
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
  board[position - 1] = value
  puts "board updated"
end

def is_winner(board)

  selection = get_selection(board)
  winner = []

  win_1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  win_2 = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  win_3 = [[1, 5, 9], [3, 5, 7]]

  win_arr = [win_1, win_2, win_3]

  win_arr.each_with_index { |item, index|
  item.include?(selection) ? winner.push(true) : winner.push(false)
  }

  winner.include?(true) ? true : false
end

def get_selection(board)

end

play = "Y"
count_play = 0
win_count = 3

while play == "Y" do
  board_02 = (1..9).to_a
  board_length = board_02.length
  puts "Board 2 : #{board_02} length : #{board_length}"

  # puts "Player 01 (X)"
  # puts "Player 02 (O)"

  value_x = "X"
  value_o = "O"

  
  puts "Player one select either 'X' or 'O' to play with:"
  player_one = gets.chomp
  player_one.upcase!
  player_two = value_x

  player_one == value_x ? (player_two = value_o) : (player_two = value_x)

  puts "Player one you selected #{player_one}"
  puts "Player two you get #{player_two}"
  
  puts "Select position (1-9) of knot or cross based on the grid numbers below:"
  # puts "1|2|3"
  # puts "4|5|6"
  # puts "7|8|9"

  display_board(board_02)
  puts "Lets begin!"
  puts

  while board_02.any?(Integer) do
    count_play += 1
    any_integers = board_02.any?(Integer)
    puts "Any integers? #{any_integers}"
    puts "Count play : #{count_play} "

    # game loop starts here

    # Player 01
    puts "Player 01 enter position"
    position_01 = gets.chomp.to_i
    # check integer value is within range
    loop do
      if (1..9).cover?(position_01)
        break
      else
        puts "Please select numbers within 1-9"
        position_01 = gets.chomp.to_i
      end
    end

    
    # update array
    update_board(board_02, position_01, player_one)
    
    puts "Board 2 : #{board_02}"
    # display position
    display_board(board_02)
    puts "X: #{board_02.count('X')}"
    (board_02.count('X'))> 2 ? (puts "count greater than 2!") : ()
    # Player 02

    board_02.any?(Integer) ? (puts "Yes there are still integers"): break

    puts "Player 02 enter position"
    position_02 = gets.chomp.to_i
    # check integer value is within range
    loop do
      if (1..9).cover?(position_02)
        break
      else
        puts "Please select numbers within 1-9"
        position_02 = gets.chomp.to_i
      end
    end

    update_board(board_02, position_02, player_two)

    puts "Board 2 : #{board_02}"
    # # display position
    display_board(board_02)
    puts "O's: #{board_02.count('O')}"
    # check win on third playthrough
    board_02.count('X') > 2 || board_02.count('O') > 2 ? "is winner?" : ()
    # board_02.count('X') > 2 || board_02.count('O') > 2 ? (puts "Count: #{count_play} - Check if win condition of 'X or'O") : ()

  end

  puts "Play Again?(Y/N):"
  play = gets.chomp
  play.upcase!
  play == 'Y'? (puts "resume play") : play = 'N'
  
end 


# setup board and players
# board = []
# 9.times {board.push("")} 
# puts "Board 1: #{board}"



