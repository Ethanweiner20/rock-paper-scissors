VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Idea Rubocop fixes for method complexity:
# - Store conditions as variables
# - Use a method to remove reduntant, but reversed logic
def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper') ||
     prompt("You won!")
  elsif (computer == 'rock' && player == 'scissors') ||
      (computer == 'paper' && player == 'rock') ||
      (computer == 'scissors' && player == 'paper') ||
     prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# Best solution: Use a separate method to test a winner
def winner?(choice1, choice2)
  (choice1 == "rock" && choice2 == "scissors") ||
    (choice1 == "paper" && choice2 == "rock") ||
    (choice1 == "scissors" && choice2 == "paper")
end

puts VALID_CHOICES
