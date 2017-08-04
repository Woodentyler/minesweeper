class Board
  attr_accessor :grid

  def initialize(grid=self.empty_grid)
    @grid = grid
    populate
  end

  def self.empty_grid
    Array.new(9) do
       Array.new(9) {Tile.new(false)}
     end
  end

  def populate(qty = 8)
    bomb_pos = []
    until bomb_pos.length == qty
      x = rand(8)
      y = rand(8)
      result = place_bomb_if_empty(x, y)
      bomb_pos << result unless result.nil?
    end
    bomb_pos
  end

  def place_bomb_if_empty(x, y)
    if !@grid[x][y].has_bomb
      @grid[x][y].has_bomb = true
      [x,y]
    else
      nil
    end
  end

  def reveal_empty_spaces_rec(pos)



    [(pos[0] - 1)..(pos[0] + 1)].each do |x|
      [(pos[1] - 1)..(pos[1] + 1)].each do |y|
        cur_pos = [x,y]
        reveal_empty_spaces_rec(cur_pos) unless cur_pos == pos
      end
    end

  end

end
