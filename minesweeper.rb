class Game
  attr_accessor :board
  attr_reader :player

  def initialize(board, player)
    @board = board
    @player = player
  end

  def run
    play_turn until @board.win? || @board.lose?
  end

  def play_turn
    @board.render
    puts "Select a position ex.[0,2]"
    pos = @player.get_pos
    puts "Reveal or flag? 'r' for reveal & 'f' for flag"
    action = @player.get_action


  end


end

game = Game.new(Board.new,Player.new('Player'))
