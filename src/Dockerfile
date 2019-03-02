FROM canelrom1/apache2:latest

LABEL maintainer="Rom1 <rom1@canel.ch> - CANEL - https://www.canel.ch"
LABEL date="07/11/2018"
LABEL description="Serveur HTTP + PHP7"

RUN apk update \
 && apk add php7 \
            php7-apache2 \
            php7-session \
            php7-mysqli

COPY ./www/phpinfo.php /var/www/html/

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2"]
