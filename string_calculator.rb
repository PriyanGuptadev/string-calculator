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

    # Split numbers using the delimiter and calculate the sum
    numbers.split(/#{delimiter}/).map(&:to_i).sum
  end
end
