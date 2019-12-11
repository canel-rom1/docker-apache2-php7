# docker-apache2-php7

## Getting started
To run the container:
```bash
$ make run
```
To test the PHP module:
```bash
http://<address>/phpinfo.php
```

## Build an image
To build your own image:
```bash
$ make build
```
With the parameters:
```bash
$ make build prefix=canelrom1 name=apache2-php7 tag=1.0
```
To clean docker images:
```bash
$ make clean
```

# Environment variable
## Apache2 container
* APACHE_RUN_USER
* APACHE_RUN_GROUP
* APACHE_SERVERADMIN
* APACHE_SERVERNAME
* APACHE_HTACCESS

## PHP Container
PHP upload limits
* PHP_LIMITS_UPLOAD

For sending a mail 
* SMTP_HOST
* SMTP_PORT
* SMTP_USER
* SMTP_PASSWORD
* SMTP_MAILFROM
