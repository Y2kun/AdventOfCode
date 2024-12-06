# file_path = "input.txt"
file_path = "test.txt"

input = File.read(file_path)

regex = /mul\((\d+),\s*(\d+)\)/
matches = input.scan(regex)

def part1(input, matches)
  result = 0
  matches.map { |a, b| result += a.to_i * b.to_i}
  puts "Result P1: #{result}"
end

def part2(input, matches)
  do = true
  result = 0
  puts "Result P2: #{result}"
end

part1(input, matches)
part2(input, matches)


# make the regex incluede the do and don't
