#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e
host="$1" ## sql server db instance name
port="$2" ## sql server port 
username="$3" ## the username in db
password="$4" ## the password in db
database_name="$5" ## the database name
shift

# clean the database
>&2 echo "Flyway is cleaning the database"
flyway -url=jdbc:jtds:sqlserver://"$host":"$port"/"$database_name" -user="$username" -password="$password" clean

# migrate the database
>&2 echo "Flyway is now running pending migrations -if any- on the database"
flyway -url=jdbc:jtds:sqlserver://"$host":"$port"/"$database_name" -user="$username" -password="$password" migrate
