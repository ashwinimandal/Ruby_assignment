class StrinCalculator
    def self.add(numbers)
        return 0 if numbers.empty?
        
        delimiter = ","
        if numbers.start_with?("//")
            delimiter, numbers = numbers.match(/^\/\/(.+)\n(.+)/).captures
        end
        
        numbers = numbers.split(/#{delimiter}|\n/).map(&:to_i)
        negatives = numbers.select { |num| num < 0 }
        
        if negatives.any?
            raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}"
        end
        
        numbers.sum
          
    end
end
