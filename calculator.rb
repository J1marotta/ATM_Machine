def calculator
  # greet the user and ask for choice of basic arithmatic
  puts "Welcome to Calculator"
  puts "What would you like to do?"

  puts "Add, Subtract, Multiply or Divide?"

  #take user input save it in lowercase in choice as a string.
  choice = gets.chomp.downcase
  puts
  puts "#{choice} Great!, which two numbers would you like to use?"

  # take two numbers from user and save them as integers
  puts "first Number? "
  first = gets.chomp.to_i
  puts "Second Number ?"
  second = gets.chomp.to_i

  #run the math method using the two numbers and the choice.
  maths(choice, first, second)
end

# method for actual arithmatic
def maths(pick, x, y)
=begin
check which type of arithmatic user wants and with exact wording
then store the result in total and print it
=end
  case pick
  when "add"
    total = x + y
    puts
    puts "#{x} plus #{y} = #{total}"
  when "subtract"
    total = x - y
    puts
    puts "#{x} minus #{y} =#{total}"
  when "multiply"
    total = x * y
    puts
    puts "#{x} times #{y} =#{total}"
  when "divide"
    total = x / y
    puts
    puts "#{x} divided by #{y} =#{total}"
  else
    puts " Invalid choice please choose \"add, subtract, muliply or divide\""
  end

end


calculator
