=begin
Jamie's Challenge; Friday 4th August 2017,
Make a terminal based program; which acts like an ATM

James Marotta

-Features to include: minimum viable product
 -Greeting == done
 -Display Balance == done
 -Withdraw
 -Deposit
bonus feature Pin code
bonus feature sounds
=end


#define a new class with features to be used by our user = currently doesn't work unsure why
# class Account
#
#   def initialize(name, pin, balance=0)
#     @name = name
#     @balance = balance
#     @pin = pin
#   end
#
#   attr_accessor :name, :pin, :balance
#
#   #method to display balance of that user
#   def display_balance
#     puts "                    Balance $#{@balance}."
#   end
#
#   #method to withdraw money
#   def withdraw(pin_number)
#     if pin_number == pin
#       @balance -= amount
#       puts "                Withdrew #{amount}."
#       puts "           Current Balance #{@balance}   "
#     else
#       puts pin_error
#     end
#   end
#
#   #define the pin
#   def pin
#     pin = @pinMaster
#   end
#
#   #if incorrect pin used
#   def pin_error
#     puts "                     Incorrect Pin"
#     say("incorrect")
#   end
# end
#

# Intro handles a greeting and Gets User Name and Pin number
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
  name = gets.capitalize
  puts
  `say "Hello #{name}, now lets set up a PIN"`
  puts "                        Hi #{name}"
  puts "            Welcome, now lets set up a pin"
  print "            "
  # save their pin number
  @pinMaster = pin_control
  say("pinaccept")

  puts
  puts "                       Keep Your Pin Safe!"
  `say "Keep your Pin Safe"`
  sleep(1)
  send_help


   #create a new Account class with the inputed Pin and Name  (currently doesn't work)
   #user = Account.new(name, @pinMaster, 0)


  #new global variable to handle balance and chances because I couldn't get classes to work.
  $balance = 100
  $chances = 0
  # run the choice function and then finish the intro method
  choice
end

# choice handles options from user and runs separate method for each.
def choice
  # While loop to continuously ask the user for a choice.
  # the Intro code will keep running while runner is equal to 1.

  say("help")
  runner = 1
  while runner == 1
    print "                       "
    choice = gets.chomp.downcase

    # run different methods depending on choice.

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
      quit
    when "h"
      say("help")
    else
      send_help
    end
  end
end

=begin
pin_check is my function to check if user gives the correct pin, I then use the
yield keyword for when the correct result is given.
=end
def pin_check

  #wait 1 second and clear the screen before starting
  sleep(1)
  system("clear")

  #chances is set to 0 as they get 3 per time.
  #chances = 0

  # once chances = 3 you're out
  unless $chances == 3
    say("enter pin")
    puts"                          Enter  PIN"
    print "                         "
    # get from user what they think old pin
    old_p = gets.chomp

    # if it doesn't match say incorrect and increase chances by 1
    if old_p != @pinMaster
      puts "                     Incorrect Pin"
      say("incorrect")
      $chances += 1
      puts "debug + #{$chances}"
    # it does match, so now re-run our pin control method to change the pin
    else
      # depending on when we are pin checking we take on a block of code
      yield
      puts chances


      # reset chances and go back to main menu and run help.
      $chances = 0
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


# display balance on screen if you give your pin
def balance
  say("balance")
  pin_check   {

    say("pinaccept")
    say("bal")
    puts
    puts "                       Your Balance is "
    puts "                       $ #{$balance} Dollaroos"
    puts
    sleep(1)
  }


end

def deposit
  system("clear")
  say("deposit")
  puts  "                    Make a Deposit"
  puts
  pin_check {

    #greeting and ask how much

    say("pinaccept")
    say("how much d")
    print "                       "

    #store the amount and conver to int, then remove from balance
    deposit = gets.chomp.to_i
    say("confirm deposit")
    $balance += deposit

    #say current balance and show on screen
    say("Rbal")
    puts
    puts "                       Your Balance is "
    puts "                       $ #{$balance} Dollaroos"
    puts
    sleep(1)
  }

end

# check pin and then lower balance by an amount
def withdrawal
  system("clear")
  say("Withdraw")
  puts  "                    Make a withdrawal"
  puts
  pin_check {

    #greeting and ask how much

    say("pinaccept")
    say("how much w")
    print "                       "

    #store the amount and conver to int, then remove from balance
    @withdraw = gets.chomp.to_i
    say("confirm withdraw")
    $balance -= @withdraw

    #say current balance and show on screen
    say("Rbal")
    puts
    puts "                       Your Balance is "
    puts "                       $ #{$balance} Dollaroos"
    puts

    # make it rain
    File.open("dolleroos.txt", "r") do |f|
      f.each_line do |line|
        puts line
      end
    end

    }

end


#change pin yielding a block to our pin_check method
def change_pin

  puts "                        Change PIN"
  say("Change pin")
  puts

  # run pin_check and feed the following block of code
  pin_check   {

    say("pinaccept")
    puts "                    Enter your New pin"
    @pinMaster = pin_control

    #print and say changed
    puts "                      PIN CHANGED"
    say("changed")
  }
end


#send_help controls all main page
def send_help
  system("clear")
  puts "

                                ,d   10,0000
                               88
                  ,adPPYYba,  MM88MMM  88,dPYba,,adPYba,
                          Y8   88      88P     88      8a
                  ,adPPPPP88   88      88      88      88
                  88,    ,88   88,     88      88      88
                    8bbdP Y8   Y88     88      88      88

                      By James Marotta

 "
  puts "                 1    for DISPLAY BALANCE"
  puts "                 2    for DEPOSIT"
  puts "                 3    for WITHDRAWAL"
  puts "                 4    to CHANGE PIN"
  puts "                 H    for HELP"
  puts "                 Q    to QUIT"
  puts
end


#quit handles leaving the atm machine
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
    puts "         Please enter a four digit pin"
    print "                  "
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



# method to handle all sounds
def say(x)

  case x
  when "intro"
    `say "Welcome to ATM MACHINE 10000. We are here to make your life amazing.
    And definitely not steal your identity,
    I see you are a new bank customer. Please enter your details. What is your name?
 "`

  when "Balance"
    `say "Display Balance"`

  when "bal"
    `say "Your current balance is #{$balance} Dollaroos"`

  when "Rbal"
    `say "Your remaining balance is #{$balance} Dollaroos"`

  when "deposit"
    `say "Make a Deposit"`

  when "Withdraw"
    `say "Make a Withdrawal"`

  when "how much w"
    `say "how much would you like to Withdraw"`

  when "how much d"
    `say "how much would you like to Deposit"`

  when "confirm withdraw"
    `say "withdrawing"`

  when "confirm withdraw"
    `say "Depositing"`

  when "change pin"
    `say "Change Pin"`

  when "enter pin"
    `say "enter Pin"`

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
