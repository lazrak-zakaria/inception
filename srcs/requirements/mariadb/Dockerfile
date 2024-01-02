FROM debian:11

ARG DBNAME
ARG DBUSER
ARG DBPASS

RUN apt-get update -y && apt-get install mariadb-server mariadb-client -y && \
    sed -i '/bind-address/c\bind-address = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mariadb start && \
    mariadb -u root -e "CREATE DATABASE ${DBNAME};" && \
    mariadb -u root -e "CREATE USER '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}';" && \
    mariadb -u root -e "GRANT ALL ON ${DBNAME}.* TO '${DBUSER}'@'%' IDENTIFIED BY '${DBPASS}';"


CMD ["mysqld"]