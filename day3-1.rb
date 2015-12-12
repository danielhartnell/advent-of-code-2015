#!/usr/bin/env ruby
# Challenge-3.1: http://adventofcode.com/
# By Daniel Hartnell

coordinates = []
coordinates << [0,0]

def houses_visited(coordinates)
  return coordinates.uniq.length
end

input = File.open("./inputs/day3-input", "r").read.each_char do |char|
  if char == "^"
    coordinates << [coordinates.last[0], coordinates.last[1] + 1]
  elsif char == "v"
    coordinates << [coordinates.last[0], coordinates.last[1] - 1]
  elsif char == ">"
    coordinates << [coordinates.last[0] + 1, coordinates.last[1]]
  elsif char == "<"
    coordinates << [coordinates.last[0] - 1, coordinates.last[1]]
  else
    # Do nothing
  end
end

puts houses_visited(coordinates)
