#!/usr/bin/env ruby
# Challenge-5.2: http://adventofcode.com/
# By Daniel Hartnell

class Modern
  def duplicate_with_delimeter(line)
    check_array = line.split('')
    check_array.each_with_index do |c, i|
      if check_array[i+2] == c
        return true
      elsif check_array[i-2] == c
        return true
      end
    end
    return false
  end

  def pair
    return false
  end
end

nice = 0
naughty = 0
process = Modern.new

input = File.open('../inputs/day5-input', 'r').read.each_line do |line|
  nice += 1 if process.duplicate_with_delimeter(line.chomp) == true
  naughty += 1 if process.duplicate_with_delimeter(line.chomp) == true
end

puts "Modern system"
puts "-------------"
puts "Nice: #{nice}"
puts "Naughty: #{naughty}"
puts "-------------"
