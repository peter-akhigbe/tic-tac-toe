require_relative 'game_board'
require_relative 'player'

class Game
  def initialize
    @board = GameBoard.new
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @moves_counter = 0
    @winner = nil
  end

  def start
    puts "Welcome To Tic-Tac-Toe Game"
    @board.display

    loop do
      turn
      check_winner

      if check_draw
        puts "It's a draw"
        break
      end

      if @winner
        puts "#{@winner} won"
        break
      end
    end
  end

  private

  def turn
    if @moves_counter % 2 == 0
      puts "Player_X, please enter a number (1-9) that is available to place 'X'"
      move = gets.chomp.to_i
      if @player_x.make_move(move, @board.board_options)
        @moves_counter += 1
      end
      @board.display
    else
      puts "Player_O, please enter a number (1-9) that is available to place 'O'"
      move = gets.chomp.to_i
      if @player_o.make_move(move, @board.board_options)
        @moves_counter += 1
      end
      @board.display
    end
  end

  def check_winner
    array = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]

    array.each do |inner_array|
      hash = {
        player_x: 0,
        player_o: 0
      }

      inner_array.each do |move|
        hash[:player_x] += 1 if @board.board_options[move] == @player_x.symbol
        hash[:player_o] += 1 if @board.board_options[move] == @player_o.symbol
      end

      if hash[:player_x] == 3
        @winner = 'Player_X'
        break
      end

      if hash[:player_o] == 3
        @winner = 'Player_O'
        break
      end
    end
  end

  def check_draw
    if @moves_counter == 9 && !@winner
      true
    end
  end
end