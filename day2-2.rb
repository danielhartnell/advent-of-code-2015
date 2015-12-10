#!/usr/bin/env ruby
# Challenge-2.2: http://adventofcode.com/
# By Daniel Hartnell

total_paper = 0
total_ribbon = 0

def order_paper(pd)
  # pd represents present dimensions
  # Accepts 3 index array where array index 0 = length, 1 = width, 2 = height
  # Returns square feet to wrap + slack

  l, w, h = pd[0], pd[1], pd[2]
  a, b, c = (l * w), (w * h), (h * l)
  slack   = [a, b, c]

  return 2*a + 2*b + 2*c + slack.min
end

def order_ribbon(pd)
  # pd represents present dimensions
  # Returns total feet of ribbon required for package dimensions
  
  l, w, h = pd[0], pd[1], pd[2]
  bow = (l * w * h)
  
  # Since the array is pre-sorted (see method call) we are adding the two smallest sides
  wrap = (pd[0].to_i * 2) + (pd[1].to_i * 2)

  return bow + wrap
end

presents = File.open("./inputs/day2-input", "r").read.each_line do |line|
  total_paper += order_paper(line.split('x').map(&:to_i))
  total_ribbon += order_ribbon(line.split('x').map(&:to_i).sort)
end

puts "Total paper (square feet): #{total_paper}"
puts "Total ribbon (feet): #{total_ribbon}"
