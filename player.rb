class Player
  attr_reader(:symbol)

  def initialize(symbol)
    @symbol = symbol
  end

  def make_move(move, arr)
    if valid_move?(move, arr)
      arr[move] = symbol
      true
    else
      false
    end
  end

  private

  def valid_move?(move, arr)
    if move.between?(1, 9) && arr[move] == move
      true
    else
      puts "Invalid Move, please enter a number (1-9) that is available to place '#{symbol}'"
      false
    end
  end
end
