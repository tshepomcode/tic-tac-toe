

class Board

  # def display_board(board)
  # def update_board(board, position, value)
  # def is_winner(board, value)


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

def is_winner(board, value)

  value_x_o = [value, value, value]
  puts "board = #{board} , value = #{value}, value_x_o = #{value_x_o}"

  is_winner = false
  win_1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  win_2 = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  win_3 = [[1, 5, 9], [3, 5, 7]]

  win_arr = [win_1, win_2, win_3]

  # win_arr.each_with_index { |item, index| puts "#{item}"}
  win_arr.each_with_index do   |item, index|
    # puts "item[#{index}] = #{item}"
    item.each_with_index do |i, idx|
      # puts " i[#{idx}] = #{i} & i(#{i[0]}, #{i[1]}, #{i[2]})"
      # puts "w7_arr.values_at(#{i[0]}, #{i[1]}, #{i[2]}) == #{value_x_o}?"
      # puts board.values_at(i[0]- 1, i[1]- 1, i[2] - 1) == value_x_o # value_x_o = ['X', 'X', 'X'] or ['O', 'O', 'O']
      a, b, c = board.values_at(i[0]- 1, i[1]- 1, i[2] - 1)
      check_win = [a, b, c]
      check_win == value_x_o ?  (is_winner = true) : ()
      # puts "Is winner? #{is_winner}"
    end
  end

  return is_winner

end

def position_taken(board, select)
end

play = "Y"
count_play = 0
win_count = 3
winner = false
player_one_score = 0
player_two_score = 0
draw = 0
any_integers = false

while play == "Y" do
  board = (1..9).to_a
  board_length = board.length
  puts "Board 2 : #{board} length : #{board_length}"

  # puts "Player 01 (X)"
  # puts "Player 02 (O)"

  value_x = "X"
  value_o = "O"

  puts "Player one select either 'X' or 'O' to play with:"
  player_one = gets.chomp
  player_one.upcase!
  player_two = value_x

  player_one == value_x ? (player_two = value_o) : (player_two = value_x)

  puts "Player One: #{player_one}"
  puts "Player Two: #{player_two}"
  
  puts "Select position (1-9) of knot or cross based on the grid numbers below:"
  # puts "1|2|3"
  # puts "4|5|6"
  # puts "7|8|9"

  display_board(board)
  puts "Lets begin!"
  puts

  while board.any?(Integer) do
    count_play += 1
    any_integers = board.any?(Integer)
    # puts "Any integers? #{any_integers}"
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
    # check if position is not already taken on the board
    loop do
      if (board[position_01 -1].is_a? Integer )
        break
      else
        puts "Position #{position_01} is already taken. Choose another"
        position_01 = gets.chomp.to_i
      end
    end
    
    # update array
    update_board(board, position_01, player_one)
    
    puts "Board 2 : #{board}"
    # display position
    display_board(board)
    puts "X: #{board.count(player_one)}"
    # (board.count(player_one))> 2 ? winner = is_winner(board, player_one) : ()
    board_count_p1 = board.count(player_one)
    winner = is_winner(board, player_one)
    if(board_count_p1 > 2 && winner)
      puts "Player #{player_one} wins"
      player_one_score += 1
      break
    end

    # Player 02
    # board.any?(Integer) ? (puts "Yes there are still integers"): break
    any_integers = board.any?(Integer)
    if !any_integers
      if !winner
        draw += 1
        break
      end
    else
        puts "Yes there are still integers"
    end
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

    # check if position is not already taken on the board
    loop do
      if (board[position_02 -1].is_a? Integer )
        break
      else
        puts "Position #{position_02} is already taken. Choose another"
        position_02 = gets.chomp.to_i
      end
    end

    update_board(board, position_02, player_two)

    puts "Board 2 : #{board}"
    # # display position
    display_board(board)
    puts "O's: #{board.count('O')}"
    # check win on third playthrough
    board_count_p2 = board.count(player_two)
    winner = is_winner(board, player_two)
    if(board_count_p2 > 2 && winner)
      puts "Player #{player_two} wins"
      player_two_score += 1
      break
    end
  end

  if winner
    puts "SCORE: Player One: #{player_one_score} | Player two: #{player_two_score} | DRAWS: #{draw}"
  else
    puts "Its a draw!"
    puts "SCORE: Player One: #{player_one_score} | Player two: #{player_two_score} | DRAWS: #{draw}"
  end
  puts "Play Again?(Y/N):"
  play = gets.chomp
  play.upcase!
  play == 'Y'? (puts "resume play") : play = 'N'
end 



