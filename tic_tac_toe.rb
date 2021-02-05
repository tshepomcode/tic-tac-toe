module Board

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
    # puts "board = #{board} , value = #{value}, value_x_o = #{value_x_o}
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
end

class Player
    attr_accessor :score, :value, :position, :win
  
    def initialize()
      @score = 0
      @value = ""
      @win = 0
      @position = 0
    end

    include Board

end



##### Program Starts here ####
play = "Y"
count_play = 0
winner = false
draw = 0
any_integers = false

player_one = Player.new
player_two = Player.new


while play == "Y" do
  board = (1..9).to_a
  board_length = board.length
  # puts "Board 2 : #{board} length : #{board_length}"

  # puts "Player 01 (X)"
  # puts "Player 02 (O)"

  value_x = "X"
  value_o = "O"

  puts "Player one select either 'X' or 'O' to play with:"
  player_one.value = gets.chomp
  player_one.value.upcase!
  player_two.value = value_x

  player_one.value == value_x ? (player_two.value = value_o) : (player_two.value = value_x)

  puts "Player One: #{player_one.value}"
  puts "Player Two: #{player_two.value}"
  
  puts "Select position (1-9) of knot or cross based on the grid numbers below:"
  # puts "1|2|3"
  # puts "4|5|6"
  # puts "7|8|9"

  player_one.display_board(board)
  puts "Lets begin!"
  puts
  # game loop starts here

  while board.any?(Integer) do
    count_play += 1
    any_integers = board.any?(Integer)
    # puts "Any integers? #{any_integers}"
    # puts "Count play : #{count_play} "

    ### Player 01

    puts "Player 01 enter position"
    player_one.position = gets.chomp.to_i
    # check integer value is within range
    loop do
      if (1..9).cover?(player_one.position)
        break
      else
        puts "Please select numbers within 1-9"
        player_one.position = gets.chomp.to_i
      end
    end
    # check if position is not already taken on the board
    loop do
      if ((board[player_one.position - 1]).is_a? Integer )
        break
      else
        puts "Position #{player_one.position} is already taken. Choose another"
        player_one.position = gets.chomp.to_i
      end
    end
    
    # update array
    player_one.update_board(board, player_one.position, player_one.value)
        
    # puts "Board : #{board}"
    # display position
    player_one.display_board(board)

    puts "#{player_one.value}'s: #{board.count(player_one.value)}"
    # (board.count(player_one))> 2 ? winner = is_winner(board, player_one) : ()
    board_count_p1 = board.count(player_one.value)
    winner = player_one.is_winner(board, player_one.value)
    if(board_count_p1 > 2 && winner)
      puts "Player #{player_one.value} wins"
      player_one.score += 1
      break
    end

    ### Player 02
    
    # board.any?(Integer) ? (puts "Yes there are still integers"): break
    any_integers = board.any?(Integer)
    if !any_integers
      if !winner
        draw += 1
        break
      end
    else
        # puts "Yes there are still integers"
    end
    puts "Player 02 enter position"
    player_two.position = gets.chomp.to_i
    # check integer value is within range
    loop do
      if (1..9).cover?(player_two.position)
        break
      else
        puts "Please select numbers within 1-9"
        player_two.position = gets.chomp.to_i
      end
    end

    # check if position is not already taken on the board
    loop do
      if ((board[player_two.position - 1]).is_a? Integer)
        break
      else
        puts "Position #{player_two.position} is already taken. Choose another"
        player_two.position = gets.chomp.to_i
      end
    end

    player_two.update_board(board, player_two.position, player_two.value)

    # puts "Board : #{board}"
    # # display position
    player_two.display_board(board)
    puts "#{player_two.value}'s: #{board.count(player_two.value)}"
    # check win on third playthrough
    board_count_p2 = board.count(player_two.value)
    winner = player_two.is_winner(board, player_two.value)
    if(board_count_p2 > 2 && winner)
      puts "Player #{player_two.value} wins"
      player_two.score += 1
      break
    end
  end

  if winner
    puts "SCORE: Player One: #{player_one.score} | Player two: #{player_two.score} | DRAWS: #{draw}"
  else
    puts "Its a draw!"
    puts "SCORE: Player One: #{player_one.score} | Player two: #{player_two.score} | DRAWS: #{draw}"
  end

  puts "Play Again?(Y/N):"
  play = gets.chomp
  play.upcase!

  loop do
    unless (play == 'Y' || play == 'N')
      puts "Please enter 'y','n', 'Y' or 'N':"
      play = gets.chomp
      play.upcase!
    else
        break
    end
  end

  play == 'Y'? (puts "resume play") : play = 'N'
  
end 