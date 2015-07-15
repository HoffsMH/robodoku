#!/usr/bin/env ruby

require_relative 'solver'

filename = ARGV[0]
puzzle = File.readlines('solved_puzzles/puzzle1.txt')
solver = Solver.new
solution = solver.solve(puzzle)
puts solution
