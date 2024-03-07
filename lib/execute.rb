require_relative './string_calculator'

# Note: This is to be un-commented only if you want to try with user input.
# In case of user input, un-comment these lines and execute the file in terminal to look for the results.


object = StringCalculator.new
puts "Enter something (comma-separated, with quotes):"
user_input = eval("[#{gets.chomp}]")
output = object.add(user_input)
puts "Output: #{output}"
