# require 'pry'

# binding.pry
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
    puts "item[#{index}] = #{item}"
    item.each_with_index do |i, idx|
      # puts " i[#{idx}] = #{i} & i(#{i[0]}, #{i[1]}, #{i[2]})"
      # puts "w7_arr.values_at(#{i[0]}, #{i[1]}, #{i[2]}) == #{value_x_o}?"
      # puts board.values_at(i[0]- 1, i[1]- 1, i[2] - 1) == value_x_o # value_x_o = ['X', 'X', 'X'] or ['O', 'O', 'O']
      a, b, c = board.values_at(i[0]- 1, i[1]- 1, i[2] - 1)
      check_win = [a, b, c]
      check_win == value_x_o ?  (is_winner = true) : ()
      # check_win == ['X', 'X', 'X'] ?  (is_winner = true) : ()
      # puts "Is winner? #{is_winner}"
    end
  end

  return is_winner

end


b1_arr = ["X", "O", "X", "O", "X", 6, 7, 8, 9]
b2_arr = ["X", "O", 3, 4, "X", "X", 7, 8, "O"]

# tie
t1_arr = ["X", "O", 3, 4, "X", "X", 7, 8, "O"]
t2_arr = ["X", "O", 3, "O", "X", "X", 7, 8, "O"]
t3_arr = ["X", "O", 3, "O", "X", "X", 7, "X", "O"]
t4_arr = ["X", "O", "O", "O", "X", "X", 7, "X", "O"]
t5_arr = ["X", "O", "O", "O", "X", "X", "X", "X", "O"]

#  win - must quit loop
w1_arr = ["X", 2, 3, 4, 5, 6, 7, 8, 9]
w2_arr = ["X", "O", 3, 4, 5, 6, 7, 8, 9]
w3_arr = ["X", "O", 3, "X", 5, 6, 7, 8, 9]
w4_arr = ["X", "O", 3, "X", 5, 6, "O", 8, 9]
w5_arr = ["X", "O", 3, "X", "X", 6, "O", 8, 9]
w6_arr = ["X", "O", 3, "X", "X", "O", "O", 8, 9]
w7_arr = ["X", "O", 3, "X", "X", "O", "O", 8, "X"]     # this is the win for X
w8_arr = ["O", "X", "X", 4, "O", "X", 7, 8, "O"]  # win for O
w9_arr = ["X", "O", "X", "X", "X", "O", "O", "O", "X"] # program should not get here!

test_x = 'X'
test_o = 'O'

puts is_winner(w8_arr, test_o)

# binding.pry
# if (t1_arr.count(test_x) > 2) 
#   puts "Yes! count: #{t1_arr.count(test_x)}"
#   puts "count is #{t1_arr.count(test_x)}"
# else 
#   puts "No!"
# end

# are the X's at location [[1, 2, 3], [4, 5, 6], [7, 8, 9]]?
# look at Array#values_at
# are the X's at location [[1, 4, 7], [2, 5, 8], [3, 6, 9]]?
# are the X's at location [[1, 5, 9], [3, 5, 7]]?


##### Work bench, code below works - commented out to test method ######
# value_x = 'X'
# value_o = 'O'

# winner = []

# win_1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# win_2 = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# win_3 = [[1, 5, 9], [3, 5, 7]]

# win_arr = [win_1, win_2, win_3]

# is_winner = false

# win_arr.each_with_index { |item, index| puts "#{item}"}
# win_arr.each_with_index do   |item, index|
#   puts "item[#{index}] = #{item}"
#   item.each_with_index do |i, idx| 
#     puts " i[#{idx}] = #{i} & i(#{i[0]}, #{i[1]}, #{i[2]})"
#     puts "w7_arr.values_at(#{i[0]}, #{i[1]}, #{i[2]}) == ['X', 'X', 'X']?"
#     puts w7_arr.values_at(i[0]- 1, i[1]- 1, i[2] - 1) == ['X', 'X', 'X']
#     a, b, c = w7_arr.values_at(i[0]- 1, i[1]- 1, i[2] - 1)
#     check_win = [a, b, c]
#     check_win == ['X', 'X', 'X'] ?  (is_winner = true) : ()
#     puts "Is winner? #{is_winner}"
#   end
# end

