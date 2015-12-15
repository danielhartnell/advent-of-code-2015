#!/usr/bin/env ruby
# Challenge-5.2: http://adventofcode.com/
# By Daniel Hartnell

class Legacy
  def vowels(line)
    vowels = 0
    line.each_char do |c|
      if c.scan(/[aeiou]/) != []
        vowels += 1
      end
    end

    return vowels
  end

  def duplicate(line)
    # Finds too many matches if first and last array elements match
    # I solved this on line 24 but I don't like the solution. It does not solve the reverse issue
    check_array = line.split('')
    check_array.each_with_index do |c, i|
      if check_array[i+1] == c
        return true
      elsif check_array[i-1] == c
        return true unless (i-1) == -1
      end
    end
    return false
  end

  def violation(line)
    ['ab','cd','pq', 'xy'].any? { |v| line.include? v }
  end

  def sentiment(line)
    if vowels(line) > 2 && violation(line) == false && duplicate(line) == true
      return "nice"
    else
      return "naughty"
    end
  end
end

class Modern
  def duplicate_with_delimeter(line)
    check_array = line.split('')
    check_array.each_with_index do |c, i|
      if check_array[i+2] == c
        return true
      elsif check_array[i-2] == c
        return true unless (i-2) == -1
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
process = Legacy.new

input = File.open('./inputs/day5-input', 'r').read.each_line do |line|
  nice += 1 if process.sentiment(line.chomp) == "nice"
  naughty += 1 if process.sentiment(line.chomp) == "naughty"
end

puts "Legacy system"
puts "-------------"
puts "Nice: #{nice}"
puts "Naughty: #{naughty}"
puts "-------------"
