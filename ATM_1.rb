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

# class Account
#   attr_acessor :name, :balance
#   def initialize(name, balance=0, pin)
#     @name = name
#     @balance = balance
#     @pinMaster =pin
#   end
#
#   def display_balance(pin_number)
#     puts pin_number == pin ? "Balance $#{@balance}." : pin_error
#   end
#
#   def withdraw(pin_number)
#



def intro

  # greet the customer
  system("clear")
  say("intro")
  puts
  puts
  puts "                     Welcome to ATM MACHINE 10000"
  puts "                We are here to make your life amazing"
  puts "                And definitely not steal your identity"
  puts
  puts "                I see you are a new bank customer"
  puts "                    Please enter your details"
  puts
  print "                            Name: "

  # save their name
  cName =gets.capitalize
  puts
  `say "Hello #{cName}, now lets set up a PIN"`
  puts "                             Hi #{cName}"
  puts "                     Welcome, now lets set up a pin"

  # save their pin number
  @pinMaster = pin_control
  say("pinaccept")
  puts @pinMaster
  puts
  puts "                       Keep Your Pin Safe!"
  `say "Keep your Pin Safe"`
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
    say("help")
    case choice
    when "1"
      say("balance")
      balance
    when "2"
      say("deposit")
      deposit
    when "3"
      say("withdraw")
      withdrawal
    when "4"
      say("change pin")
      change_pin
    when "q"
    #  say("quit")
      quit
    when "h"
      send_help
      say("help")
    else
      send_help
    end
  end
end

def change_pin
=begin
 change pin method, asks user for old pin and if it matches allows to asign a new pin
 if it doesn't match they get three chances before the police are called
=end

  #wait 1 second and clear the screen before starting
  sleep(1)
  system("clear")
  #chances is set to 0 as they get 3 per time.
  chances = 0

  # once chances = 3 you're out
  unless chances == 3
    # display to the screen and sound
    puts "                        Change PIN"
    say("Change pin")
    puts
    puts"                          Old PIN"
    # get from user what they think old pin
    old_p = gets.chomp

    # if it doesn't match say incorrect and increase chances by 1
    if old_p != @pinMaster
      puts "                     Incorrect Pin"
      say("incorrect")
      chances += 1
    # it does match, so now re-run our pin control method to change the pin
    else
      say("pinaccept")
      puts "                    Enter your New pin"
      @pinMaster = pin_control
      #print and say changed
      puts "                      PIN CHANGED"
      say("changed")

      # reset chances and go back to main menu and run help.
      chances = 0
      send_help
    end
  else
    # chances = 3 so the police are called
    sleep(1)
    puts "                    Three strikes, you're Out"
    puts
    police
  end
end


def send_help
  system("clear")
  puts "                 1    for DISPLAY BALANCE"
  puts "                 2    for DEPOSIT"
  puts "                 3    for WITHDRAWAL"
  puts "                 4    to CHANGE PIN"
  puts "                 H    for HELP"
  puts "                 Q    to QUIT"
  puts
end

def quit
# method for quitting from the main menu.
  system("clear")
  say("quit")
  puts
  puts "      You can't quit yet we are buying stuff with your card in India"
  puts "                       hahaha, joking... "
  puts "                             ... "
  puts "                      Really Quit? [y/n]"
  say("Really?")
  puts
  quit = gets.chomp.downcase
  case quit
  when "y"
    puts
    puts "              Thanks for choosing ATM Machine 10000"
    say("thankyou")
    puts
    runner = 2
    exit
  when "n"
    puts
    puts "        Great choice, we are just hacking your facebook now"
    say("staying")
    puts
    send_help
  else
    puts
    puts "                      Really quit? [y/n]"
    say("Really?")
  end
  end



#pin_control method for changing, the pin,
def pin_control
  # if length doesn't equal 4 keep asking
  begin
    puts "                   Please enter a four digit pin"
    say("four")
    newPin = gets.chomp
  end while newPin.length != 4
  # return the new pin given
  return newPin
end


# Police prints a police car and arrests the user
def police
  say("police")
  # displays a warning
  5.times {
    puts "                    WARNING WARNING WARNING"
    puts "              : ! The police are on their way ! :"
    puts "                    WARNING WARNING WARNING"
    sleep(1)
  }

  # Pause for dramatic effect.
  sleep (2)

  # Bring the po po
  File.open("police.txt", "r") do |f|
    f.each_line do |line|
      puts line
    end
  end
  # end the program
  runner = 2
  exit
end



## New method to handle sounds
def say(x)

  case x
  when "intro"
    `say "Welcome to ATM MACHINE 10000."`

  when "Balance"
    `say "Display Balance"`

  when "deposit"
    `say "Make a Deposit"`

  when "Withdraw"
    `say "Make a Withdrawal"`

  when "change pin"
    `say "Change Pin"`

  when "incorrect"
    `say "Incorrect PIN"`

  when "pinaccept"
    `say "PIN Accepted"`

  when "changed"
    `say "Pin Successfully Change"`

  when "police"
    `say " WARNING, WARNING, WARNING"`
    `say "Three times wrong pin, you must be a criminal"`
    `say "We know you are trying to hack us,  YOU ARE UNDER ARREST"`
    `say "The police are on their way "`

  when "four"
    `say "Please Enter a four Digit PIN"`

  when "quit"
    `say "You can't quit yet we are buying stuff with your card in India, hahaha, joking.."`

  when "Really?"
    `say "Really Quit?"`

  when "staying"
    `say "Great choice, we are just hacking your facebook now"`

  when "thankyou"
    `say "thank you for choosing ATM Machine 10000"`

  when "help"
    `say "Push 1 for DISPLAY BALANCE"`
    `say "Push 2 for Deposit"`
    `say "Push 3 for Withdrawal"`
    `say "Push 4 to change PIN"`
    `say "Push H to Repeat the Help"`
    `say "Push Q to QUIT"`

  end
end


intro
