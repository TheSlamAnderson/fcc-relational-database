#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# year,round,winner,opponent,winner_goals,opponent_goals

while IFS="," read -r year round winner opponent winner_goals opponent_goals
do

  # get team_id for winner
  WIN_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '${winner}';")"
  if [[ -z $WIN_TEAM_ID ]]
  then
    ADD_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('${winner}');")"
    WIN_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '${winner}';")"
  fi

  # get team_id for opponent
  OPP_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '${opponent}';")"
  if [[ -z $OPP_TEAM_ID ]]
  then
    ADD_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('${opponent}');")"
    OPP_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '${opponent}';")"
  fi

  # create game
  CREATE_GAME="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(${year}, '${round}', ${WIN_TEAM_ID}, ${OPP_TEAM_ID}, ${winner_goals}, ${opponent_goals});")"

done < <(tail -n +2 games.csv)
