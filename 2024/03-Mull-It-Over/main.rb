# file_path = "input.txt"
file_path = "test.txt"

input = File.read(file_path)

def part1(input)
  matches = input.scan(/mul\((\d+),\s*(\d+)\)/)
  result = 0
  matches.map { |a, b| result += a.to_i * b.to_i}
  puts "Result P1: #{result}"
end

def part2(input)
  result = 0
  matches = input.scan(/(do|don't)?\s*mul\((\d+),\s*(\d+)\)/)
  matches.each do | match |
    puts match.inspect
  end
 
  puts "Result P2: #{result}"
end

# part1(input)
part2(input)


# make the regex incluede the do and don't
