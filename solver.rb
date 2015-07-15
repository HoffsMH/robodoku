require 'pry'
class Solver

end


class Puzzle
  attr_accessor :cells
  def initialize
    @cells = []
    
  end
  def load(puzzle_string_array)

    @cells = puzzle_string_array.map.with_index(0) do |line, line_number|     

        row_of_cells = line.split('').map do |char|
          Cell.new(char)
        end
        row_of_cells
        
        
    end

  end

  
  
  def add_trailing_whitespace(line)
    line.gsub!("\n", " ")
    line.ljust(9)
    
  end
  

end
class Cell
  attr_accessor :value, :possibilities, :is_a_given
  def initialize(value)
    @value =  value
    @possibilities = [1..9]
    @is_a_given = true
  end
  
end

#ask dont tell
#I want to call a cell like this
# puzzle.cell[0,8].value => 8
# puzzle.cell[0,8].possibilities => [0,4,1,5]
# puzzle.cell[0,8].get_row_neighbors => [0,9,3]
# puzzle.cell[0,8].c
      # 0                         1
# [[cell0, cell1, cell2], [cell0,cell1,cell2]]