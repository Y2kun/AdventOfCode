file_path = "input.txt"
# file_path = "test.txt"

input = File.read(file_path)

rules, updates = input.split("\n\n")

rules = rules.split("\n").map do |line|
  line.split("|").map(&:to_i)
end

updates = updates.split("\n").map do |line|
  line.split(",").map(&:to_i)
end

def part1(rules, updates)
  result = 0
  
  updates.each do |update|
    rules_satisfied = rules.all? do |left, right|
      left_i = update.index(left)
      right_i = update.index(right)

      left_i && right_i ? left_i < right_i : true
    end

    result += update[update.size / 2] if rules_satisfied
  end

  puts "Result P1: #{result}"
end

def part2(rules, updates)
  result = 0

  puts "Result P2: #{result}"
end

part1(rules, updates)
part2(rules, updates)

# IDEAS

# to find out if the rules are upheld i have to somehow check all the following int if they are correct

# to find the center, tak the length /2 then ceil
