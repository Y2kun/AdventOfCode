file_path = "input.txt"
# file_path = "test.txt"

data = File.readlines(file_path).map { |line| line.split.map(&:to_i) }

def is_safe?(report)
  differences = report.each_cons(2).map { |a, b| b - a }
  
  is_increasing = differences.all? { |diff| diff > 0 }
  is_decreasing = differences.all? { |diff| diff < 0 }

  valid_differences = differences.all? { |diff| diff.abs.between?(1, 3) }

  return (is_increasing || is_decreasing) && valid_differences
end

def is_safe_with_dampener?(report)
  return true if is_safe?(report)
  
  report.each_with_index do |_, i|
    modified_report = report[0...i] + report[i+1..-1]
    return true if is_safe?(modified_report)
  end
  
  false
end

def part1(data)
  result = 0
  data.each_with_index do |report, level|
    if is_safe?(report)
      result += 1
    else
    end
  end
  puts "Result P1: #{result}"
end

def part2(data)
  result = data.count { |report| is_safe_with_dampener?(report) }
  puts "Result P2: #{result}"
end

part1(data)
part2(data)
