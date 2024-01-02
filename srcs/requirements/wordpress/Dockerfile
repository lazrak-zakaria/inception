FROM debian:11

WORKDIR /var/www/html

RUN apt-get update && apt-get install curl php-fpm php-mysql mariadb-client -y   && \
	sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/'  /etc/php/7.4/fpm/pool.d/www.conf      && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root

COPY ./tools/config.sh /

RUN chmod +x /config.sh

CMD  ["/config.sh"]