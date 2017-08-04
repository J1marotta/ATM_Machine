=begin
Jamie's Challenge; Friday 4th August 2017,
Make a terminal based program; which acts like an ATM

James Marotta

-Features to include: minimum viable product
 -Greeting
 -Display Balance
 -Withdraw
 -Deposit
=end

def intro

  # greet the customer
  puts
  puts
  puts "Welcome to ATM MACHINE 10000"
  puts "We are here to make your life amazing"
  puts "And definitely not steal your identity"
  puts
  puts "1 to Withdraw"
  puts "2 to Check Balance"
  puts "3 to Make a Deposit"


# defines my 
  list = []
=begin
While loop to continuously ask the user for a choice.
the Intro code will keep running while runner is equal to 1.
=end
  runner = 1
  while runner == 1
    choice = gets.chomp.downcase

 # run different methods depending on choice.
    case choice
    when "start"
      add_program(list)
    when "print"
      print_program(list)
    when "finish"
      finish_program(list)
      #print with a nice message and set exit code
      runner == 2
    when "help"
      send_help
    when "remove"
      remove_item(list)
    else
      puts "start, print, finish, or help for help"
    end
  end
end
