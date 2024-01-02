FROM debian:11

ARG CERT
ARG CERTKEY
ARG CERTPATH
ARG CERTPATHCONF

RUN apt-get update && apt-get install nginx openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ${CERTKEY} -out ${CERT} -subj "/CN=zlazrak.42.fr" \
	&& echo  "ssl_certificate" ${CERT} ";" > ${CERTPATH}  \
	&& echo  "ssl_certificate_key" ${CERTKEY} ";" >> ${CERTPATH} \ 
	&& echo  "ssl_protocols TLSv1.2 ;" >> ${CERTPATH} \
	&& echo  "daemon off;" >> /etc/nginx/nginx.conf

COPY ./conf/default.conf /etc/nginx/sites-enabled/

RUN sed -i "s/__REPLACE__/${CERTPATHCONF}/" /etc/nginx/sites-enabled/default.conf

CMD ["nginx"]

