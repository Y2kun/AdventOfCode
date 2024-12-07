require 'strscan'

file_path = "input.txt"
# file_path = "test.txt"

input = File.read(file_path)

def part1(input)
  matches = input.scan(/mul\((\d*),*(\d*)\)/)
  result = 0
  matches.map { |a, b| result += a.to_i * b.to_i}
  puts "Result P1: #{result}"
end

def part2(input)
  strscanner = StringScanner.new(input)
  result = 0
  doing = true

  while !strscanner.eos?
    if strscanner.scan(/do\(\)/)
      doing = true
    elsif strscanner.scan(/don't\(\)/)
      doing = false
    elsif (match = strscanner.scan(/mul\((\d+),(\d+)\)/))
      if doing
        a, b = match.match(/mul\((\d+),(\d+)\)/).captures.map(&:to_i)
        result += a * b
      end
    else
      strscanner.getch
    end
  end

    puts "Result P2: #{result}"
end

part1(input)
part2(input)

