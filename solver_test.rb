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
      cell0 = Cell.new('h', 0,0)
      expected = Cell
      result = cell0.class
      
      assert_equal(expected, result)
      
    end
  end
  describe '.value' do
    it 'it returns the value of the given cell' do
      cell0 = Cell.new('h', 0,0)
      expected = 'h'
      result = cell0.value
      
      assert_equal(expected, result)
    end
    
  end
  
  describe ".write(cell, number)" do
    it "it writes a number to a cell, changing the puzzle object"
  end
  describe ".given(cell)" do
    it "returns whether or not a cell (that has a value or is blank) has been changed with the write method"
  end
  describe ".to_str" do
    it "prints out a puzzles current state.. solved or unsolved" do
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      
      puzzle.load(puzzle_string_array)
      
      result = puzzle.to_str
      expected = "8  5 4  7\n  5 3 9  \n 9 7 1 6 \n1 3   2 8\n 4     5 \n2 78136 4\n 3 9 2 8 \n  2 7 5  \n6  3 5  1\n"
      
      assert_equal(expected, result)
      # puts puzzle.to_str
      
      
    end
  end
  
end
describe Puzzle do
  
  describe ".add_trailing_whitespace(line)" do
    it "adds trailing whitespace to line before parsing it into cell objects" do
      puzzle = Puzzle.new
      line_string = " 1 9\n"
      
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
      
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      # puzzle_string_
      puzzle.load(puzzle_string_array)
      
      expected = '4'
      result = puzzle.cells[4][1].value
      
      assert_equal(expected, result)
    end    
    
    
  end
  
  describe ".get_column_neighbors(cell)" do
    it "returns the value of every non blank cell in a column for a given cell as an array" do
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      # puzzle_string_
      puzzle.load(puzzle_string_array)
      expected = ["1","2","6"]
      result =   puzzle.get_column_neighbors(puzzle.cells[0][0])     
      
      assert_equal(expected, result)
    end
    
  end
  describe ".get_row_neighbors(cell)" do
    it "returns the value of every non blank cell in a row for a given cell as an array" do
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      # puzzle_string_
      puzzle.load(puzzle_string_array)
      expected = ["3","9"]
      result =   puzzle.get_row_neighbors(puzzle.cells[1][2])     
      
        assert_equal(expected, result)
    end
    
    
  end
  describe ".get_box_row_limits(cell)" do
    it "returns the upper and lower bounds of a box in rows" do
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      # puzzle_string_
      puzzle.load(puzzle_string_array)
      expected = [0,2]
      result =   puzzle.get_box_row_limits(puzzle.cells[1][1])
      
      assert_equal(expected, result)       
    end     
  end
  describe ".get_box_column_limits(cell)" do
    it "returns the upper and lower bounds of a box in columns" do
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      # puzzle_string_
      puzzle.load(puzzle_string_array)
      expected = [3,5]
      result =   puzzle.get_box_column_limits(puzzle.cells[5][5])
      
      assert_equal(expected, result)       
    end     
  end
  describe ".get_box_neighbors(cell)" do
    it "returns the value of every non blank cell in a given box as an array" do
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      # puzzle_string_
      puzzle.load(puzzle_string_array)
      expected = ["1","3","4","2","7"].sort
      result =   puzzle.get_box_neighbors(puzzle.cells[3][0])
      
      
      assert_equal(expected, result) 
    end
    
    it "returns the value of every non blank cell in a given box as an array number 2" do
      puzzle = Puzzle.new
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      # puzzle_string_
      puzzle.load(puzzle_string_array)
      expected = ["8","5","1"].sort
      result =   puzzle.get_box_neighbors(puzzle.cells[8][8])
      
      
      assert_equal(expected, result) 
    end
    
  end
  
end
