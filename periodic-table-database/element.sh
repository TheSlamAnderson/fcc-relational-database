#!/bin/bash

# GET ARGUMENTS
if [[ $# == 0 ]]
then
  echo "Please provide an element as an argument."
  exit
fi
USER_INPUT=$1

# BUILD DB CONNECTION
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

# GET ATOMIC NUMBER
if [[ "$USER_INPUT" =~ ^[0-9]+$ ]];
then
  AN="$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '${USER_INPUT}';")"
elif [[ ${#USER_INPUT} > 3  ]];
then
  AN="$($PSQL "SELECT atomic_number FROM elements WHERE name = '${USER_INPUT}';")"
else
  AN="$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '${USER_INPUT}';")"
fi

# PRINT RESPONSE
if ! [[ -z "$AN" ]];
then
  ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements AS e INNER JOIN properties AS p ON p.atomic_number = e.atomic_number INNER JOIN types AS t ON t.type_id = p.type_id WHERE e.atomic_number = ${AN};")
  echo "$ELEMENT_INFO" | while read ANUM P NAME P SYMBOL P TYPE P ATOMIC_MASS P MPC P BPC
  do
    echo "The element with atomic number $ANUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
  done
else
  echo "I could not find that element in the database."
fi
