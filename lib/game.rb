class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    if self.over? && !self.won?
      return true
    end
  end

  def over?
    if self.board.full?
      return true
    else
      return false
    end
  end

  def winner
    if self.won?
      if current_player.token == "O"
        return "X"
      else
        return "O"
      end
      else
        return nil
    end
  end

  def turn
    input = gets.strip
  end

  def play
    case
    when self.won?
      puts "Congratulations #{self.winner}!"
    when self.draw?
      puts "Cat's Game!"
    end
  end

end
