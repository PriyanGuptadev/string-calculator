class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Check if the input contains a custom delimiter
    if numbers.start_with?("//")
      delimiter = numbers[2..numbers.index("\n") - 1]  # Extract delimiter
      numbers = numbers[(numbers.index("\n") + 1)..]  # Remove the delimiter line
    else
      delimiter = /[\n,]/  # Default - commas and newlines
    end

    # Split numbers using the delimiter
    num_array = numbers.split(/#{delimiter}/).map(&:to_i)

    # Check for negative numbers
    negatives = num_array.select { |num| num < 0 }

    if negatives.any?
      # Raise Exception
      raise "negative numbers not allowed #{negatives.join(', ')}"
    end

    # Return sum
    num_array.sum
  end
end
