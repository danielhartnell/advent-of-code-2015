#!/usr/bin/env ruby

floor = 0
directions = File.open("./inputs/day1-input", "r").read.chomp.split('').each do |s|
  floor += 1 if s == "("
  floor -= 1 if s == ")"
end

puts "Go to floor: #{floor}"
