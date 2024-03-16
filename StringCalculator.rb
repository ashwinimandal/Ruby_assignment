class StrinCalculator
    def self.add(numbers)
        return 0 if numbers.empty?
        
        delimiter = /[, \n]/
        if numbers.start_with?("//")
            delimiter = numbers[2]
            numbers = numbers[4..-1]
        end
        
        numbers.split(delimiter).map(&:to_i).each do |num|
            raise "Negative numbers not allowed: #{num}" if num.negative?
        end.reduce(:+)
          
    end
end

# Test cases
puts StrinCalculator.add("")       # Output: 0
puts StrinCalculator.add("1")      # Output: 1
puts StrinCalculator.add("1,5")    # Output: 6
puts StrinCalculator.add("1\n2,3") # Output: 6
puts StrinCalculator.add("//;\n1;2") # Output: 3