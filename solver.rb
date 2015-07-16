require 'pry'

class Solver
  attr_accessor :puzzle
  def solve(puzzle_string_array)
    @puzzle =  Puzzle.new
    @puzzle.load(puzzle_string_array)
    
    pass_counter = 0
    while !@puzzle.solved? && pass_counter <= 1000 do 
      make_pass(@puzzle)
      pass_counter += 1       
    end
    
    #output
    puts "\n"
    puts @puzzle.to_str
    
  end
  
  def make_pass(puzzle)
    cells = puzzle.cells.flatten
    
    cells.each do |cell|
      cell.possibilities = deduce(@puzzle, cell) 
      #the reason I am deducing even if the cell already has a value
      #is that in later versions I plan for a value to be "penciled in"
      #as a guess for dependancy logic
      if cell.value == " " && cell.possibilities.length == 1
        cell.write(cell.possibilities[0])         
      end
      
    end
  end
  
  def deduce(puzzle, cell)
    cell.possibilities -= puzzle.get_row_neighbors(cell)
    cell.possibilities -= puzzle.get_column_neighbors(cell)
    cell.possibilities -= puzzle.get_box_neighbors(cell)
    
  end
  
end


class Puzzle
  attr_accessor :cells, :puzzle_string_array, :solved
  
  def initialize
    @cells = []  
    @solved = false   
  end
  def solved?
    @solved
  end
  
  def load(puzzle_string_array)     
    @puzzle_string_array = puzzle_string_array
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
    line.gsub!("\n", "")
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
  def get_box_row_limits(cell) 
    row = cell.row
    if row >= 0 && row <= 2
      return [0,2]
    end
    if row >= 3 && row <= 5
      return [3, 5]
    end
    if row >=  6 && row <= 8 
      return [6 , 8]
    end
    
  end
  
  def get_box_column_limits(cell) 
    column  = cell.column
    if column >= 0 && column <= 2
      return [0, 2]
    end
    if column >= 3 && column <= 5
      return [3, 5]
    end
    if column >=  6 && column <= 8 
      return [6 , 8]
    end
    
  end
  
  def get_box_neighbors(cell)
    lower = 0
    upper = 1
    
    
    lower_row =  get_box_row_limits(cell)[lower]
    upper_row = get_box_row_limits(cell)[upper]
    
    lower_column = get_box_column_limits(cell)[lower]
    upper_column = get_box_column_limits(cell)[upper]
    
    box_values = []
    box_cells = @cells[lower_row..upper_row].flat_map do |this_row|
      this_row[lower_column..upper_column].select do |this_cell|
        this_cell.value != " "         
      end
    end
    
    box_cell_values = box_cells.map do |this_cell|
      this_cell.value
    end
    box_cell_values.sort     
  end
  
  def to_str
    output = ""
    @cells.each do |row|
      row.each do |cell|
        output << cell.value
        
      end
      output << "\n"
    end
    output
    
  end   
end
class Cell
  attr_accessor :value, :possibilities, :is_a_given, :row, :column, :given
  def initialize(value, row, column)
    @value =  value
    @possibilities = ["1","2","3","4","5","6","7","8","9"]
    @is_a_given = true
    @row = row
    @column = column
  end   
  def write(value)
    @value = value
    @is_a_given = false
  end
end

#tell dont ask
#I want to call a cell like this
# @puzzle.cell[0,8].value => 8
# puzzle.cell[0,8].possibilities => [0,4,1,5]
# puzzle.cell[0][8].get_row_neighbors => [0,9,3]
# puzzle.cell[0,8].c
# 0                         1
# [[cell0, cell1, cell2], [cell0,cell1,cell2]]