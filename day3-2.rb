#!/usr/bin/env ruby
# Challenge-3.2: http://adventofcode.com/
# By Daniel Hartnell

coordinates = []
robo_coordinates = []
coordinates << [0,0]
robo_coordinates << [0,0]
robo_santa = false

def houses_visited(coordinates,robo_coordinates)
  total = coordinates.concat robo_coordinates
  return total.uniq.length
end

input = File.open("./inputs/day3-input", "r").read.each_char do |char|
  if robo_santa == false
    if char == "^"
      coordinates << [coordinates.last[0], coordinates.last[1] + 1]
    elsif char == "v"
      coordinates << [coordinates.last[0], coordinates.last[1] - 1]
    elsif char == ">"
      coordinates << [coordinates.last[0] + 1, coordinates.last[1]]
    elsif char == "<"
      coordinates << [coordinates.last[0] - 1, coordinates.last[1]]
    else
    end
  elsif robo_santa == true
    if char == "^"
      robo_coordinates << [robo_coordinates.last[0], robo_coordinates.last[1] + 1]
    elsif char == "v"
      robo_coordinates << [robo_coordinates.last[0], robo_coordinates.last[1] - 1]
    elsif char == ">"
      robo_coordinates << [robo_coordinates.last[0] + 1, robo_coordinates.last[1]]
    elsif char == "<"
      robo_coordinates << [robo_coordinates.last[0] - 1, robo_coordinates.last[1]]
    else
    end
  end

  robo_santa = !robo_santa
end

puts houses_visited(coordinates,robo_coordinates)
