class Puzzle
  @cells = [[Cell.new(2, self),Cell.new(4),Cell.new(2),Cell.new(1),]
            [Cell.new(2),Cell.new(1),Cell.new(2),Cell.new(6),]]
end
class Cell
  attr_accessor :value, :puzzle
  def initialize(value, puzzle)
    @value = value
    @puzzle = puzzle
  end
  def my_neighbors_by_row
    puzzle.neighbors_of(self)
  end
end