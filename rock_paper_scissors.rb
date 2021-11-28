# Rock Paper Scissors

# PROBLEM
# ============================================================================

=begin

Input:
- User choice
- Computer choice

Output:
- Display of the winner

Questions:
- How are the choices represented? Strings?

Mental Models:
- Store each choice as a hash, with an associated "wins_to" and "lose_to" choice
- Store all 9 possible pairs, and match the 2 choices with the associated
combinations

=end

# ALGORITHM
# ============================================================================

=begin

Each key represent the choice and its associated losers
CHOICES = {
  "rock": "scissors",
  "paper": "rock",
  "scissors": "paper"
}

SUBPROCESS user_choice
  prompt
  receive input
  validate input on CHOICES

SUBPROCESS computer_choice
  CHOICES.sample => random choice

SUBPROCESS run_game(user_choice, computer_choice)
  if winner?(user_choice, computer_choice) print user wins
  elsif winner?(computer_choice, user_choice) print computer wins
  else print they are tied

SUBPROCESS winner?(choice_1, choice_2)
  CHOICES[choice_1] == choice_2

run_game

=end

# CODE
# ============================================================================

# A Choice is a key-value pair where the key is the choice and the value is the
# choice's associated loser(s)

CHOICES = {
  "rock" => "scissors",
  "paper" => "rock",
  "scissors" => "paper"
}

def prompt(message)
  puts "==> #{message}"
end

def retrieve_user_choice
  choice = ''
  loop do
    choice = gets.chomp.strip.downcase
    break if CHOICES.keys.include?(choice)
    prompt("Please re-enter your choice (rock/paper/scissors)")
  end
  
  choice
end

def retrieve_computer_choice
  CHOICES.keys.sample
end

def display_results(user_choice, computer_choice)
  message = if user_choice == computer_choice then "You tied with the computer."
            elsif CHOICES[user_choice] == computer_choice then "You won :D"
            elsif CHOICES[computer_choice] == user_choice then "The computer
              won :("
            end
  prompt(message)
end

loop do
  prompt("Choose one: #{CHOICES.keys.join(', ')}")
  user_choice = retrieve_user_choice()

  computer_choice = retrieve_computer_choice()
  puts "The computer chose #{computer_choice}!"

  display_results(user_choice, computer_choice)

  prompt("Would you like to play again? (y/n)")
  again_input = gets.chomp.downcase
  break unless again_input.starts_with?('y')
end

prompt("Thank you for playing. Goodbye.")
