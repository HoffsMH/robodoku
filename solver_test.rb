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

end


describe Puzzle do
  describe '.convert_line_to_hash(line, line_number)' do
    it 'takes a line and a line number and returns a hash to be merged with larger hash' do
        puzzle = Puzzle.new
        line = '8 8'
        line_number = 0

        expected = {[0,0] => '8', [1,0] => ' ', [2,0] => '8'}
        result = puzzle.convert_line_to_hash(line, line_number)

        assert_equal(expected, result)


    end

  end
  describe ".add_trailing_whitespace(line)" do
    it "adds trailing whitespace to line before parsing it into hash" do
      puzzle = Puzzle.new
      puzzle_line = ""
      puzzle_line << " 8 43 2\n"
      
      expected = " 8 43 2  "
      result = puzzle.add_trailing_whitespace(puzzle_line)
      
      assert_equal(expected, result)
    end  
    
  end
  describe ".load(puzzleString)" do
    it "turns simple puzzle_string_array into a puzzle_coord_hash" do

      puzzle = Puzzle.new
      puzzle_string_array = []
      puzzle_string_array << "8 9"

      expected = {[0, 0]=>"8", [1, 0]=>" ", [2, 0]=>"9", [3, 0]=>" ", [4, 0]=>" ", [5, 0]=>" ", [6, 0]=>" ", [7, 0]=>" ", [8, 0]=>" "}
      result = puzzle.load(puzzle_string_array)

      assert_equal(expected, result)
    end
    it "turns simple multiline puzzle_string_array into a puzzle_coord_hash" do

      puzzle = Puzzle.new
      puzzle_string_array = []
      puzzle_string_array << "8 9"
      puzzle_string_array << " 3 "


      expected = {[0, 0]=>"8", [1, 0]=>" ", [2, 0]=>"9", [3, 0]=>" ", [4, 0]=>" ", [5, 0]=>" ", [6, 0]=>" ", [7, 0]=>" ", [8, 0]=>" ", 
        [0, 1]=>" ", [1, 1]=>"3", [2, 1]=>" ", [3, 1]=>" ", [4, 1]=>" ", [5, 1]=>" ", [6, 1]=>" ", [7, 1]=>" ", [8, 1]=>" "}
      result = puzzle.load(puzzle_string_array)

      assert_equal(expected, result)
    end
    it "turns converts a full Sudoku puzzle_string_array into a puzzle_coord_hash" do
      skip
      puzzle_string_array = []
      puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
      puzzle = Puzzle.new



      expected = {[0, 0]=>"8", [1, 0]=>" ", [2, 0]=>" ", [3, 0]=>"5", [4, 0]=>" ", [5, 0]=>"4", [6, 0]=>" ", [7, 0]=>" ", [8, 0]=>"7",
         [0, 1]=>" ", [1, 1]=>" ", [2, 1]=>"5", [3, 1]=>" ", [4, 1]=>"3", [5, 1]=>" ", [6, 1]=>"9", [7, 1]=>" ", [8, 1]=>" ", 
         [0, 2]=>" ", [1, 2]=>"9", [2, 2]=>" ", [3, 2]=>"7", [4, 2]=>" ", [5, 2]=>"1", [6, 2]=>" ", [7, 2]=>"6", [8, 2]=>" ",
         [0, 3]=>"1", [1, 3]=>" ", [2, 3]=>"3", [3, 3]=>" ", [4, 3]=>" ", [5, 3]=>" ", [6, 3]=>"2", [7, 3]=>" ", [8, 3]=>"8",
         [0, 4]=>" ", [1, 4]=>"4", [2, 4]=>" ", [3, 4]=>" ", [4, 4]=>" ", [5, 4]=>" ", [6, 4]=>" ", [7, 4]=>"5", [8, 4]=>" ",
         [0, 5]=>"2", [1, 5]=>" ", [2, 5]=>"7", [3, 5]=>"8", [4, 5]=>"1", [5, 5]=>"3", [6, 5]=>"6", [7, 5]=>" ", [8, 5]=>"4", 
         [0, 6]=>" ", [1, 6]=>"3", [2, 6]=>" ", [3, 6]=>"9", [4, 6]=>" ", [5, 6]=>"2", [6, 6]=>" ", [7, 6]=>"8", [8, 6]=>" ", 
         [0, 7]=>" ", [1, 7]=>" ", [2, 7]=>"2", [3, 7]=>" ", [4, 7]=>"7", [5, 7]=>" ", [6, 7]=>"5", [7, 7]=>" ", [8, 7]=>" ", 
         [0, 8]=>"6", [1, 8]=>" ", [2, 8]=>" ", [3, 8]=>"3", [4, 8]=>" ", [5, 8]=>"5", [6, 8]=>" ", [7, 8]=>" ", [8, 8]=>"1"}
      result = puzzle.load(puzzle_string_array)

      assert_equal(expected, result)
    end
    
  end
  describe ".get_cell_value(coord)" do
    it "returns current value of a given cell" do
        puzzle = Puzzle.new
        puzzle_string_array = []
        puzzle_string_array = File.readlines('solved_puzzles/puzzle1.txt')
        puzzle.load(puzzle_string_array)
        
        expected = "5"
        result = puzzle.get_cell_value([2,1])
        
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
