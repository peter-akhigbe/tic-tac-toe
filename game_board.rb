class GameBoard
  attr_accessor(:board_options)

  def initialize
    @board_options = [nil, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display
    puts "
       #{@board_options[1]} | #{@board_options[2]} | #{@board_options[3]}
      ---|---|---
       #{@board_options[4]} | #{@board_options[5]} | #{@board_options[6]}
      ---|---|---
       #{@board_options[7]} | #{@board_options[8]} | #{@board_options[9]}
    "
  end
end
