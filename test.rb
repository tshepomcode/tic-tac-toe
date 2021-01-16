require 'pry'

def is_winner(selection)

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

# debugging entry
# binding.pry


board_main = (1..9).to_a

# hash with win conditions?
win_hash = {
  win1: [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
  win2: [[1, 4, 7], [2, 5, 8], [3, 6, 9]],
  win3: [[1, 5, 9], [3, 5, 7]]
}
win_1_arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
win_2_arr  = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
win_3_arr  = [[1, 5, 9], [3, 5, 7]]

# compare using array comparitor <=> Returns an integer 
# (-1, 0, or +1) if this array is less than, equal to, or greater than other_ary.

idx_win = [3, 5, 2]

winner = [win_1_arr, win_2_arr, win_3_arr]

# winner.each {|win| puts win.include?(idx_win)}
# winner.each {|win| win.include?(idx_win) ? (puts "Winner: #{win}" ): (puts "Loser: #{win}")}

puts is_winner(idx_win)

# puts win_1_arr.include?(idx_win_3)
