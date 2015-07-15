require 'pry'
class Solver
  def solve(puzzle_string_array)
    puzzle =  Puzzle.new
    puzzle.load(puzzle_string_array)
  end
end


class Puzzle
  attr_accessor :cells
  ee = 2
  def initialize
    @cells = []     
  end
  
  def load(puzzle_string_array)     
    
    @cells = puzzle_string_array.map.with_index(0) do |line, line_number|       
      line = add_trailing_whitespace(line)
      split_row(line, line_number)
    end
    
  end
  def split_row(line, line_number)
    line.split('').map.with_index(0) do |char, char_number|
      Cell.new(char, line_number, char_number)   
    end
  end
  
  
  
  def add_trailing_whitespace(line)
    line.gsub!("\n", " ")
    line.ljust(9)
    
  end
  
  
  def get_column_neighbors(cell)
    column =  @cells.map do |this_cell|
      this_cell[cell.column].value
    end
    column.delete(" ")
    column.delete(cell.value)
    column
  end
  
  def get_row_neighbors(cell)
    row = @cells[cell.row].map do |this_cell|
      this_cell.value
    end
    row.delete(" ")
    row.delete(cell.value)
    row     
  end
  def get_box_neighbors(cell)
  end
  
  
end
class Cell
  attr_accessor :value, :possibilities, :is_a_given, :row, :column
  def initialize(value, row, column)
    @value =  value
    @possibilities = [1..9]
    @is_a_given = true
    @row = row
    @column = column
  end
  
  
end

#ask dont tell
#I want to call a cell like this
# puzzle.cell[0,8].value => 8
# puzzle.cell[0,8].possibilities => [0,4,1,5]
# puzzle.cell[0][8].get_row_neighbors => [0,9,3]
# puzzle.cell[0,8].c
# 0                         1
# [[cell0, cell1, cell2], [cell0,cell1,cell2]]