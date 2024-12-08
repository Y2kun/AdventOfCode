file_path = "input.txt"
# file_path = "test.txt"

input = File.readlines(file_path)

def part1(input)
  result = 0

  # works well
  input.each_with_index do |line, pos|
    (0...line.length-3).each do |i|
      result += [line[i..i+3], input[pos][i..i+3]].select{|w| ["XMAS", "SAMX"].include?(w) }.size
    end
  end

  # # does not work 
  # (0..input.length-3).each do |row|
  #   # Check diagonal (top left to bottom right) for winner
  #   (0..row.length-3).each do |i|
  #     result += 1 if input[pos][i] == "X" && input[pos+1][i+1] == "M" && input[pos+2][i+2] == "A" && input[pos+3][i+3] == "s"
  #   end

  #   # Check diagonal (bottom left to top right) for winner
  #   (0..row.length-3).each do |row|
  #     result += 1 if input[pos][i] == "S" && input[pos-1][i+1] == "A" && input[pos-2][i+2] == "M" && input[pos-3][i+3] == "X"
  #   end
  # end

  puts "Result P1: #{result}"
end

def part1(input)
  result = 0

  # horizontal
  input.each_with_index do |line, row|
    (0..line.length - 4).each do |col|
      substring = line[col..col + 3]
      result += 1 if ["XMAS", "SAMX"].include?(substring)
    end
  end

  # vertically
  (0..input.length - 4).each do |row|
    (0..input[row].length - 1).each do |col|
      vertical_string = (0..3).map { |offset| input[row + offset][col] }.join
      result += 1 if ["XMAS", "SAMX"].include?(vertical_string)
    end
  end

  #diagonally (top-left to bottom-right)
  (0..input.length - 4).each do |row|
    (0..input[row].length - 4).each do |col|
      diagonal_string = (0..3).map { |offset| input[row + offset][col + offset] }.join
      result += 1 if ["XMAS", "SAMX"].include?(diagonal_string)
    end
  end

  # diagonally (bottom-left to top-right)
  (3...input.length).each do |row|
    (0..input[row].length - 4).each do |col|
      diagonal_string = (0..3).map { |offset| input[row - offset][col + offset] }.join
      result += 1 if ["XMAS", "SAMX"].include?(diagonal_string)
    end
  end

  puts "Result P1: #{result}"
end


def part2(input)
  result = 0
  (0..input.length - 3).each do |row|
    (0..input[row].length - 3).each do |col|
      if input[row][col] == "M" && input[row][col + 2] == "S" &&
         input[row + 1][col + 1] == "A" &&                      
         input[row + 2][col] == "M" && input[row + 2][col + 2] == "S"
        result += 1
      end
      if input[row][col] == "S" && input[row][col + 2] == "M" &&
         input[row + 1][col + 1] == "A" &&                      
         input[row + 2][col] == "S" && input[row + 2][col + 2] == "M"
        result += 1
      end
      if input[row][col] == "M" && input[row][col + 2] == "M" &&
         input[row + 1][col + 1] == "A" &&                      
         input[row + 2][col] == "S" && input[row + 2][col + 2] == "S"
        result += 1
      end
      if input[row][col] == "S" && input[row][col + 2] == "S" &&
         input[row + 1][col + 1] == "A" &&                      
         input[row + 2][col] == "M" && input[row + 2][col + 2] == "M"
        result += 1
      end
    end
  end
  
  puts "Result P2: #{result}"
end

part1(input)
part2(input)
