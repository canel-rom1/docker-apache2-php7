#!/bin/sh

# Configuration msmtp
MSMTPRC_FILE="/etc/msmtprc"
[ -n "${SMTP_HOST}" ]     && sed -i "s/<HOST>/${SMTP_HOST}/"         "${MSMTPRC_FILE}"
[ -n "${SMTP_PORT}" ]     && sed -i "s/<PORT>/${SMTP_PORT}/"         "${MSMTPRC_FILE}"
[ -n "${SMTP_MAILFROM}" ] && sed -i "s/<MAILFROM>/${SMTP_MAILFROM}/" "${MSMTPRC_FILE}"
[ -n "${SMTP_USER}" ]     && sed -i "s/<USER>/${SMTP_USER}/"         "${MSMTPRC_FILE}"
[ -n "${SMTP_PASSWORD}" ] && sed -i "s/<PASSWORD>/${SMTP_PASSWORD}/" "${MSMTPRC_FILE}"

# Configuration PHP
# Limits PHP upload
if [ -n "${PHP_LIMITS_UPLOAD}" ]
then
        echo "PHP_LIMITS_UPLOAD ${PHP_LIMITS_UPLOAD}" > /dev/stdout
        sed -i "/upload_max_filesize/s/2M/${PHP_LIMITS_UPLOAD}/g" /etc/php7/php.ini
fi
