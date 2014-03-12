#!/bin/bash

if [ ! $(env | grep -q TYPE) ]
then
	sudo gearmand --log-file=gearman.log -p $GEARMAN_PORT -d 
# gearmand with postgres configuration
elif [ "$(echo $TYPE | awk '{ print tolower($1) '})" = "postgres" ]
then
	# start gearmand 
	gearmand --queue-type=Postgres \ 
		--verbose=DEBUG \
		--libpq-conninfo=\"dbname=$PSQL_DB user=$PSQL_USER pass=$PSQL_PASS\" \
		--log-file=gearman.log -d

fi

