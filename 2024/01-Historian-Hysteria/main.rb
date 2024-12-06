file_path = "input.txt"
# file_path = "test.txt"

left  = []
right = []

File.open(file_path, "r") do |file|
  file.each_line do |line|
    left_num, right_num = line.split.map(&:to_i)
    left << left_num
    right << right_num
  end
end

def part1(left, right)
  left = left.sort
  right = right.sort

  result = 0
  for i in 0...left.size
     result += (left[i] - right[i]).abs
  end

  puts "Result P1: #{result}"
end

def part2(left, right)
  result = 0
  for i in 0...left.size
     result += left[i] * right.count(left[i])
  end

  puts "Result P2: #{result}"
end

part1(left, right)
part2(left, right)
