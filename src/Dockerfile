FROM canelrom1/apache2:0.6

LABEL maintainer="Rom1 <rom1@canel.ch> - CANEL - https://www.canel.ch"
LABEL date="24/03/2020"
LABEL description="Serveur HTTP + PHP7"

RUN apk add --no-cache --update \
            msmtp \
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

COPY ./entrypoint-php.sh /entrypoints/20-php.sh
RUN chmod +x /entrypoints/20-php.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2"]
