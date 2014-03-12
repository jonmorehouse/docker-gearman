#!/bin/bash

get_value() {
	
	PREFIX=$(env | grep _DB | awk '{ split($0,a,"_"); print a[1] }')
	KEY="$1"
	VALUE=$(printenv "${PREFIX}_${KEY}")
	if [ ! "$VALUE" ]; then

		echo $(printenv "$KEY")
	else
		echo $VALUE
	fi
}

if [ ! $(env | grep QUEUE ) ]; then
	sudo gearmand --log-file=gearman.log -p $GEARMAN_PORT -d 

# gearmand with postgres configuration
elif [ "$(echo $QUEUE | awk '{ print tolower($1) '})" = "postgres" ]; then

	# grab variables needed
	DB=$(get_value "DB")
	USER=$(printenv "USER")
	PASS=$(printenv "PASS")

	# start gearmand 
	gearmand --verbose=DEBUG \
		--queue-type=Postgres \
		--libpq-conninfo=\"dbname=$DB user=$USER pass=$PASS host=$PSQL_HOST port=$PSQL_PORT\" \
		--log-file=gearman.log -d \
		-p 4730

fi

