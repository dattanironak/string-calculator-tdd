# string_calculator.rb
class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?
      if numbers.start_with?("//")
        parts = numbers.split("\n", 2)
        delimiter = parts[0][2]
        numbers = parts[1]
        nums = numbers.split(delimiter).map(&:to_i)
      else
        nums = numbers.split(/,|\n/).map(&:to_i)
      end

      negatives = nums.select { |n| n < 0 }
      unless negatives.empty?
        raise "negative numbers not allowed: #{negatives.join(', ')}"
      end
      
      nums.sum
    end
  end
  