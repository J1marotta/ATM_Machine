=begin
Jamie's Challenge; Friday 4th August 2017,
Make a terminal based program; which acts like an ATM

James Marotta

-Features to include: minimum viable product
 -Greeting
 -Display Balance
 -Withdraw
 -Deposit
bonus feature Pin code
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
    when "q"
      quit
    else
      puts
      puts "1 for Display Balance"
      puts "2 for Deposit"
      puts "3 for Withdrawl"
      puts "4 to change PIN"
      puts "h for Help"
      puts "q to quit"
      puts
    end
  end
end

def change_pin(pin)
  chances = 0
  puts "Change Pin"
  puts
  puts "old PIN"
  old_p = gets.chomp.to_i
  if old_p != pin
    puts  "Incorrect Pin"
    chance += 1

end


def send_help
  puts "1 for Display Balance"
  puts "2 for Deposit"
  puts "3 for Withdrawl"
  puts "4 to change PIN"
  puts "h for Help"
  puts "q to quit"
end

def quit
 puts
 puts "You can't quit yet we are buying stuff with your card in India"
 puts
 puts "hahaha, joking... "
 puts " ... "
 puts "Really Quit? [y/n]"
 quit = gets.chomp.downcase
 case quit
 when "y"
   puts
   puts "thanks for choosing ATM Machine 10000"
   puts
   runner = 2
   exit
 when "n"
   puts
   puts "Great choice, we are just hacking your facebook now"
   puts
 else
   puts
   puts "Really quit? [y/n]"
end

intro
