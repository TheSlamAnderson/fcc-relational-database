#!/bin/bash

## === DATABASE FUNCTIONS === ##

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

Sql_Get_Game_Data() {
  GAME_DATA=$($PSQL "SELECT count(*), MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID;")
}

Sql_Get_User_Id() {
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
}

Sql_Insert_Game() {
  GAME_INSERT=$($PSQL "INSERT INTO games (user_id, number_of_guesses, secret_number) VALUES ($USER_ID, $NUM_GUESS, $SECRET_NUMBER);")
}

Sql_Insert_Username() {
  USER_ID_INSERT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME');")
}

## === GETTER FUNCTIONS === ##

Get_User_Id() {
  Sql_Get_User_Id
  if [[ -z $USER_ID ]];
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    Sql_Insert_Username
    Sql_Get_User_Id
  fi
}

Get_User_Game_Data() {
  Sql_Get_Game_Data
  echo "$GAME_DATA" | while read GAMES_PLAYED BAR BEST_GAME;
  do
    if ! [[ -z $BEST_GAME ]];
    then
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi
  done
}

Get_Valid_Username() {
  echo "Enter your username:"
  read USERNAME
  if [[ -z $USERNAME ]];
  then
    Get_Valid_Username
  fi
  if [[ ${#USERNAME} -gt 22 ]];
  then
    echo "Please try again. Username must be 22 characters or less."
    Get_Valid_Username
  fi
}

Get_User_Guess() {
  read USER_GUESS
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]];
  then
    echo "That is not an integer, guess again:"
    Get_User_Guess
  else
    ((NUM_GUESS=NUM_GUESS+1))
  fi
}

## === SETTER FUNCTIONS === ##

Set_Secret_Number() {
  SECRET_NUMBER=$[ $RANDOM % 1000 + 1 ]
}

Set_User_Data() {
  # Get Valid Username
  Get_Valid_Username

  # Get User ID
  Get_User_Id

  # Get User Game Data
  Get_User_Game_Data
}

## === MAIN SCRIPT === ##

# Set Up User and Secret Number
Set_User_Data
Set_Secret_Number
NUM_GUESSES=0

# Begin the Game
echo "Guess the secret number between 1 and 1000:"
Get_User_Guess

while [ $USER_GUESS != $SECRET_NUMBER ];
do
  if [ $USER_GUESS -gt $SECRET_NUMBER ];
  then
    echo "It's lower than that, guess again:"
    Get_User_Guess
  fi
  if [ $USER_GUESS -lt $SECRET_NUMBER ];
  then
    echo "It's higher than that, guess again:"
    Get_User_Guess
  fi
done

# End the Game
Sql_Insert_Game
echo "You guessed it in $NUM_GUESS tries. The secret number was $SECRET_NUMBER. Nice job!"
exit

## === END OF SCRIPT === ##
