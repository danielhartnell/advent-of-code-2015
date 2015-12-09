#!/usr/bin/env ruby

floor = 0
directions = File.open("./challenge-1-input.txt", "r").read.chomp.split('').each do |s|
  floor += 1 if s == "("
  floor -= 1 if s == ")"
end

puts "Go to floor: #{floor}"
