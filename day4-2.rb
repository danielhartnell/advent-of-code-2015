#!/usr/bin/env ruby
# Challenge-4.2: http://adventofcode.com/
# By Daniel Hartnell

require 'digest'

secret_key = "yzbqklnj"
n = 0

while true do
  result = Digest::MD5.hexdigest "#{secret_key.chomp}#{n}"
  if result[0..5] == "000000"
    puts "Found it: #{result} with n of #{n}"
    break
  end
  n += 1
end
