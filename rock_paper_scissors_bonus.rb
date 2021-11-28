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

CHOICES = {
  "r" => "rock",
  "p" => "paper",
  "sc" => "scissors",
  "l" => "lizard",
  "sp" => "spock"
}

# WINNING_COMBINATIONS is a hash where each key-value pair represents a winning
# combination in which _key_ is the winner and _

WINNING_COMBINATIONS = {
  "rock" => ["scissors", "lizard"],
  "paper" => ["rock", "spock"],
  "scissors" => ["paper", "lizard"],
  "lizard" => ["spock", "paper"],
  "spock" => ["scissors", "rock"]
}

wins = {
  "user" => 0,
  "computer" => 0
}

def prompt(message, new_line: false)
  puts "==> #{message}"
  puts if new_line
end

def display_choices
  prompt("Choose one:")
  CHOICES.each { |key, value| prompt("#{key} = #{value}") }
end

def retrieve_user_choice
  input = ''
  loop do
    input = gets.chomp.strip.downcase
    break if CHOICES.keys.include?(input)
    prompt("Please re-enter your choice (#{CHOICES.keys.join('/')})")
  end

  CHOICES[input]
end

def retrieve_computer_choice
  CHOICES.values.sample
end

def determine_winner(user_choice, computer_choice)
  if beats?(user_choice, computer_choice) then "user"
  elsif beats?(computer_choice, user_choice) then "computer"
  end
end

def beats?(choice1, choice2)
  WINNING_COMBINATIONS[choice1].include?(choice2)
end

def display_game_status(wins)
  if wins["user"] == 3
    prompt("You are the grand winner! The final score is #{wins['user']}-
    #{wins['computer']}. The game is over.")
  elsif wins["computer"] == 3
    prompt("The computer is the grand winner! The final score is #{wins['user']}
    -#{wins['computer']}. The game is over.")
  else
    prompt("Current game status:")
    prompt("User Wins: #{wins['user']}, Computer Wins: #{wins['computer']}",
           new_line: true)
  end
end

# MAIN PROGRAM

loop do
  display_choices()

  user_choice = retrieve_user_choice()
  prompt("You chose #{user_choice}!")

  computer_choice = retrieve_computer_choice()
  prompt("The computer chose #{computer_choice}!")

  if user_choice == computer_choice
    prompt("You tied the match!", new_line: true)
  else
    winner = determine_winner(user_choice, computer_choice)
    wins[winner] += 1
    prompt("The #{winner} won the match!", new_line: true)
  end

  display_game_status(wins)
  break if wins[winner] == 3

  prompt("Press any key to continue to the next match.")
  gets
  system("clear")
end

prompt("Thank you for playing. Goodbye.", new_line: true)

# BONUS FEATURES
# ============================================================================

=begin

1. I already stored by game logic in a hash, so this bonus update didn't
require a big leap in my code.

2. I see a few possible solutions. If we want to forcify the pattern where
users only must type one letter for each choice, then we must ask for a second
verification upon an 's' input. Otherwise, we could use two-letter
abbreviatons, 'sc' and 'sp', for scissors and spock, respectively.

3. This will require new local variables, `player_wins` and `computer_wins`. We
will readjust the program such that the user is not given an option as to
whether they will play again -- whther a new game is played is entirely
dependent on the status of the overall match.

=end

# ========================================================================
