#!/bin/bash

#to solve /run/php problem

service php7.4-fpm start
service php7.4-fpm stop

if [ ! -e wp-config.php ]
then

	# sleep 8;

	wp config create --dbname=${DBNAME} --dbuser=${DBUSER} --dbpass=${DBPASS} --dbhost=${DBHOST} --allow-root

	if [ ! -e wp-config.php ]
	then
		exit 1;
	fi

	wp core install --url=${WPURL} --title=${WPTITLE} --admin_user=${WPADMIN} --admin_password=${WPADMINPASS} --admin_email=${WPADMINMAIL} --allow-root

	wp user create ${WPUSER} ${WPUSEREMAIL}  --role=${WPROLE} --user_pass=${WPPASS} --allow-root
fi

exec php-fpm7.4 -F
