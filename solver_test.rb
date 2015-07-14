gem 'minitest', '~>5.0'

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

require_relative 'solver'

describe Solver do


  describe ".solve(puzzle string)" do
    it "hands a puzzle object to load()"
    it "returns a puzzle object"
  end

  describe '.deduce(cell)' do
    it "returns list of numbers that could exist in a given cell coordinate"
  end
  describe '.fill_in(cell, value)' do
    it "tells the puzzle object to use the write function to a given cell"
    #could or could not succeed (the solver could be trying to write over something already given)
  end
  describe '.pencil_in(cell, value)' do
    it "writes to a cell's possibilities"
    
  end

end

describe Cell do
  describe '.value' do
    it 'it returns the value of the given cell'
    
  end
  
  describe ".get_column_neighbors(cell)" do
    it "returns the value of every non blank cell in a column for a given cell as an array"

  end
  describe ".get_row_neighbors(cell)" do
    it "returns the value of every non blank cell in a row for a given cell as an array"

  end
  describe ".get_box_neighbors(cell)" do
    it "returns the value of every non blank cell in a zone for a given cell as an array"
  end
  describe ".write(cell, number)" do
    it "it writes a number to a cell, changing the puzzle object"
  end
  describe ".given(cell)" do
    it "returns whether or not a cell (that has a value or is blank) has been changed with the write method"
  end
  describe ".to_str" do
    it "prints out a puzzles current state.. solved or unsolved"
  end
  
end
describe Puzzle do

  describe ".add_trailing_whitespace(line)" do
    it "adds trailing whitespace to line before parsing it into cell objects" do
      
      
    end  
    
  end
  describe ".load(puzzleString)" do
    puzzle = Puzzle.new
    puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
    puzzle.load(puzzle_string_array)
    
    result = puzzle.cells[0][3].value
    
    
    
  end
  
  


end
