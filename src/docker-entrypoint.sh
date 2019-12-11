#!/bin/sh

set -e
trap "echo SIGNAL" HUP INT QUIT KILL TERM

ENTRYPOINT="/entrypoint.sh"
if [ -f "${ENTRYPOINT}" ]
then
        source ${ENTRYPOINT}
fi

# Configuration msmtp
MSMTPRC_FILE="/etc/msmtprc"
[ -n "${SMTP_HOST}" ]     && sed -i "s/<HOST>/${SMTP_HOST}/"         "${MSMTPRC_FILE}"
[ -n "${SMTP_PORT}" ]     && sed -i "s/<PORT>/${SMTP_PORT}/"         "${MSMTPRC_FILE}"
[ -n "${SMTP_MAILFROM}" ] && sed -i "s/<MAILFROM>/${SMTP_MAILFROM}/" "${MSMTPRC_FILE}"
[ -n "${SMTP_USER}" ]     && sed -i "s/<USER>/${SMTP_USER}/"         "${MSMTPRC_FILE}"
[ -n "${SMTP_PASSWORD}" ] && sed -i "s/<PASSWORD>/${SMTP_PASSWORD}/" "${MSMTPRC_FILE}"

PHP_INI="/etc/php7/php.ini"

if [ "${1:0:1}" = "-" ] ; then
	exec /usr/sbin/httpd "$@"
fi

if [ "$1" = "/usr/sbin/httpd" ] ; then
	exec "$@"
fi

if [ "$1" = "apache2" ] ; then
	exec /usr/sbin/httpd -D FOREGROUND -f /etc/apache2/httpd.conf
fi

exec "$@"
