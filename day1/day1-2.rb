#!/usr/bin/env ruby
# Challenge-1: http://adventofcode.com/
# By Daniel Hartnell

def is_basement(floor, index)
  if floor == -1
    # Since array index starts at zero but we want position I'll increment index by 1
    puts "#{floor} occurs at index: #{index+1}"
  end
end

floor = 0
directions = File.open("../inputs/day1-input", "r").read.chomp.split('').each_with_index do |value, index|
  floor += 1 if value == "("
  floor -= 1 if value == ")"
  is_basement(floor, index)
end
