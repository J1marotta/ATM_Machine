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
  system("clear")
  puts
  puts
  puts "Welcome to ATM MACHINE 10000"
  puts "We are here to make your life amazing"
  puts "And definitely not steal your identity"
  puts
  puts "I see you are a new bank customer"
  puts "Please enter your details"
  puts "Name"

  # save their name
  cName =gets.chomp.capitalize
  puts "Hi #{cName} Welcome, now lets set up a pin"

  # save their pin number
  @pinMaster = pin_control


  puts @pinMaster
  puts "Okay Great"
  sleep(1)
  send_help
# run the choice function
choice
end

def choice
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
    when "q"
      quit
    else
      send_help
    end
  end
end

def change_pin
  puts @pinMaster
  system("clear")
  chances = 0
  while chances < 3
    puts "Change Pin"
    puts
    puts "Old PIN"
    old_p = gets.chomp
    if old_p != @pinMaster
      puts  "Incorrect Pin"
      chances += 1
    else
      puts @pinMaster
      # new_p = 0
      puts "Enter your New pin"
      @pinMaster = pin_control
      puts "PIN CHANGED"
      chances = 0
      sleep(1)
      send_help
    break
    end
  end
    puts "Three strikes, you're Out"
    puts
    police
end


def send_help
  system("clear")
  puts "1    for DISPLAY BALANCE"
  puts "2    for DEPOSIT"
  puts "3    for WITHDRAWAL"
  puts "4    to CHANGE PIN"
  puts "h    for HELP"
  puts "q    to QUIT"
  puts
end

def quit
  system("clear")
 puts
 puts "You can't quit yet we are buying stuff with your card in India"
 puts "hahaha, joking... "
 puts " ... "
 puts "Really Quit? [y/n]"
 puts
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
   help
 else
   puts
   puts "Really quit? [y/n]"
 end
end

def pin_control
  begin
    # @pin = pin
    puts "Please enter a four digit pin"
    newPin = gets.chomp
  end while newPin.length != 4
  return newPin
  # @pinMaster = pin
end



intro
