#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# Generate a random number between 1 and 100
NUMBER=$(shuf -i 1-100 -n 1)
# echo $NUMBER

# Player guess
PLAYER_GUESS=0

# Counter for the player how many times the player guessed 
COUNT=1

# Function for check player guess
CHECK_ANSWER() {
  # if input is not integer
  if [[ ! $PLAYER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read PLAYER_GUESS
  elif [[ $PLAYER_GUESS -le $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read PLAYER_GUESS
  elif [[ $PLAYER_GUESS -ge $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read PLAYER_GUESS
  fi
  # increment the counter
  ((COUNT++))
}

echo -e "\n~~~~~ GUESS THE RANDOM NUMBER ~~~~~\n"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM accounts WHERE username = '$USERNAME'")

# if there is no id found, insert new user
if [[ -z $USER_ID ]] 
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
  read PLAYER_GUESS
  while [[ $NUMBER != $PLAYER_GUESS ]]
  do
    CHECK_ANSWER
  done

  echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"

  # insert new player to database
  INSERT_ACCOUNT=$($PSQL "INSERT INTO accounts(username,games_played,best_game) VALUES('$USERNAME',1,$COUNT)")
else
  # get games_played and best_game from database
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM accounts WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM accounts WHERE user_id = $USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
  echo "Guess the secret number between 1 and 1000:"
  read PLAYER_GUESS
  while [[ $NUMBER != $PLAYER_GUESS ]]
  do
    CHECK_ANSWER
  done

  echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"

  # if current play is less than best_game, overwrite best_game with counter
  if (( $COUNT <= $BEST_GAME )) 
  then
    BEST_GAME=$COUNT
  fi

  # updata database
  UPDATE_ACCOUNT=$($PSQL "UPDATE accounts SET games_played = $GAMES_PLAYED + 1, best_game = $BEST_GAME WHERE user_id = $USER_ID")  
fi

# DONE