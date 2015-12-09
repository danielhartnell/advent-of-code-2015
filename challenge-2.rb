#!/usr/bin/env ruby
# Challenge-2: http://adventofcode.com/
# By Daniel Hartnell

total = 0

def order_paper(pd)
  # pd represents present dimensions
  # Accepts 3 index array where array index 0 = length, 1 = width, 2 = height
  # Returns square feet to wrap + slack

  l, w, h = pd[0], pd[1], pd[2]
  a, b, c = (l * w), (w * h), (h * l)
  slack   = [a, b, c]

  return 2*a + 2*b + 2*c + slack.min
end

presents = File.open("./challenge-2-input.txt", "r").read.each_line do |line|
  total += order_paper(line.split('x').map(&:to_i))
end

puts total
