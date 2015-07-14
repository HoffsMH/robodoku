class Solver

end


class Puzzle
  def initialize
    @puzzle_coord_hash = {}
  end
  def load(puzzle_string_array)
    puzzle_coord_hash = {}

    puzzle_string_array.each_with_index do |line, line_number|
      line = add_trailing_whitespace(line)
      line_hash = convert_line_to_hash(line, line_number)
      puzzle_coord_hash = puzzle_coord_hash.merge(line_hash)
    end
    @puzzle_coord_hash = puzzle_coord_hash
    return puzzle_coord_hash

  end

  def convert_line_to_hash(line, line_number)
    hash = {}
    line.split('').each_with_index do |char, index|
      unless char == "\n"
        hash[[index, line_number]] = char
      end
    end
    return hash
  end
  
  def add_trailing_whitespace(line)
    line.gsub!("\n", " ")
    line.ljust(9)
    
  end
  def get_cell_value(coord)
    @puzzle_coord_hash[coord]
  end


end
