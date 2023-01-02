#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

MAIN_MENU() {

  # show list of available services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id ASC;")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # get service selection
  echo -e "\nPlease select a service:"
  read SERVICE_ID_SELECTED
  
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  if [[ -z $SERVICE_NAME ]];
  then
    MAIN_MENU
  else

    echo -e "\nPlease enter your phone number:"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get new customer name
      echo -e "\nPlease enter your name:"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi

    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # get service_time
    echo -e "\nPlease enter a time for your service:"
    read SERVICE_TIME

    # insert appointment
    INSERT_APPT_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

    # output confirmation message
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
}

MAIN_MENU
