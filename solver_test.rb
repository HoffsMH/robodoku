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
  describe '.new(value)' do
    it "instantiates a new cell object" do
      cell0 = Cell.new('h')
      expected = Cell
      result = cell0.class
      
      assert_equal(expected, result)
      
    end
  end
  describe '.value' do
    it 'it returns the value of the given cell' do
      cell0 = Cell.new('h')
      expected = 'h'
      result = cell0.value
      
      assert_equal(expected, result)
    end
    
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
      puzzle = Puzzle.new
      line_string = " 1 9
"
      
      expected = " 1 9     "
      result = puzzle.add_trailing_whitespace(line_string)
      
      assert_equal(expected, result)
    end  
    
  end
  describe ".load(puzzleString)" do
    it "loads a single row of puzzle objects" do
      
      puzzle = Puzzle.new
      puzzle_string_row = " 8  2 3"
      puzzle_string_array = []
      puzzle_string_array << puzzle_string_row
      puzzle.load(puzzle_string_array)
      
      result = puzzle.cells[0][1].value
      expected = '8'
      
      assert_equal(expected, result)
      
      
    end
    it "loads a full sudoku puzzle of cell objects" do
      skip
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      # puzzle_string_
      puzzle.load(puzzle_string_array)
      
      expected = '4'
      result = puzzle.cells[4][1].value
      
      assert_equal(expected, result)
    end    
    
    
  end
  
  
  
  
end
