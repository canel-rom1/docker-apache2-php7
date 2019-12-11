FROM canelrom1/apache2:latest

LABEL maintainer="Rom1 <rom1@canel.ch> - CANEL - https://www.canel.ch"
LABEL date="09/09/2019"
LABEL description="Serveur HTTP + PHP7"

RUN apk update \
 && apk add msmtp \
            php7 \
            php7-apache2 \
            php7-dev \
            php7-json \
            php7-mysqli \
            php7-pear \
            php7-session

RUN ln -fs /usr/bin/msmtp /usr/sbin/sendmail

COPY ./www/phpinfo.php /var/www/html/
COPY ./conf/msmtprc /etc/msmtprc

EXPOSE 80
EXPOSE 443

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2"]
