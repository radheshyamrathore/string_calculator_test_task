require 'byebug'
class StringCalculator
  def add(*args)
		a = args.flatten
    @results = a.map do |input|
      parse_input(input)
    end

    @results.join(', ')
  end

  def parse_input(input)
    return 0 if input.empty?

    raise_if_negatives_present(input)
    digits(input).inject { |sum, x| sum + x }
  end

  def raise_if_negatives_present(input)
    negatives = digits(input).select { |x| x < 0 }
    puts "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end

  def digits(input)
    delimiter = determine_delimiter(input)
    input.gsub("\n", delimiter).split(delimiter).map(&:to_i)
  end

  def determine_delimiter(input)
    input.start_with?("//") ? input[2] : ','
  end
end
