require 'pry'

# binding.pry
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
w8_arr = ["X", "O", 3, "X", "X", "O", "O", "O", "X"]   # program should not get here!
w9_arr = ["X", "O", "X", "X", "X", "O", "O", "O", "X"] # program should not get here!

test_x = 'X'
test_o = 'O'

# binding.pry
if (t1_arr.count(test_x) > 2) 
  puts "Yes!"
else 
  puts "No!"
end

# are the X's at location [[1, 2, 3], [4, 5, 6], [7, 8, 9]]?
# are the X's at location [[1, 4, 7], [2, 5, 8], [3, 6, 9]]?
# are the X's at location [[1, 5, 9], [3, 5, 7]]?