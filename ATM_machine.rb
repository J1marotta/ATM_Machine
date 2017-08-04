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
  puts "I see you are a new bank customer"
  puts "Please enter your details"
  puts "Name"
  cName =gets.chomp
  puts "Hi #{cName} Welcome, now lets set up a pin"
  puts "Please enter a four digit pin"
  pin = gets.chomp
  puts
  puts "Okay Great"
  puts
  puts "1 for Display Balance"
  puts "2 for Deposit"
  puts "3 for Withdrawl"
  puts "4 to change PIN"
  puts "h for Help"
  puts

  choice(pin)
end

def choice(pin)
=begin
While loop to continuously ask the user for a choice.
the Intro code will keep running while runner is equal to 1.
=end
  runner = 1
  while runner == 1
    choice = gets.chomp.downcase

 # run different methods depending on choice.
    case choice
    when "1"
      balance
    when "2"
      deposit
    when "3"
      withdrawal
    when "4"
      change_pin
    when "h"
      send_help
    else
      puts
      puts "1 for Display Balance"
      puts "2 for Deposit"
      puts "3 for Withdrawl"
      puts "4 to change PIN"
      puts "h for Help"
      puts
    end
  end
end

intro
