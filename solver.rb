class Solver

end


class Puzzle
  attr_accessor :cells
  def initialize
    @cells = [[]]
    
  end
  def load(puzzle_string_array)

    puzzle_string_array.each_with_index do |line, line_number|
      line.split('').each do |char|
        @cells[line] <<
        
      end
      
      
    end
  end

  
  
  def add_trailing_whitespace(line)
    line.gsub!("\n", " ")
    line.ljust(9)
    
  end
  

end
class Cell
  attr_accessor :value, :possibilities, :is_a_given
  def initialize(value, coord)
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
