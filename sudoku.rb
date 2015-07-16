#!/usr/bin/env ruby

require_relative 'solver'

filename = ARGV[0]
puzzle = File.readlines(filename)
solver = Solver.new
solution = solver.solve(puzzle)
puts "\n\n"
puts solution
