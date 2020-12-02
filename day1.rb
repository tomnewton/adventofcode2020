#!/usr/bin/env ruby
# frozen_string_literal: true

def part_one(values, sum_to = 2020)
  nums = {}
  values.each do |value|
    nums[value.to_i] = 1
  end
  print @nums

  nums.each do |key, _value|
    other = sum_to - key
    return key * other if nums[other]
  end
end

def part_two(values, sum_to = 2020)
  nums = []
  values.each do |value|
    nums.append(value.to_i)
  end

  nums = nums.sort

  nums.each_with_index do |first, i|
    nums.drop(i + 1).each_with_index do |second, j|
      break if second + first >= sum_to

      nums.drop(j + 1).each do |third, _k|
        break if third + second + first > sum_to
        return third * second * first if third + second + first == sum_to
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  @values = File.readlines('day1.input')
  puts "Part 1: #{part_one(@values)}"
  puts "Part 2: #{part_two(@values)}"
end
