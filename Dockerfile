FROM alpine:latest 
RUN apk add --no-cache \
    apache2-proxy \
    apache2-ssl \
    apache2-utils \
    curl \
    git \
    logrotate \
    openssl \
    git bash php php7-dev apache2 gcc \
    libc-dev make php7-pdo php7-json \
    php7-session php7-pecl-psr \
    php7-apache2 
WORKDIR /
RUN git clone "https://github.com/phalcon/cphalcon.git"
WORKDIR /cphalcon/build
RUN git checkout v4.1.3
RUN ./install
RUN echo "extension=phalcon.so" > /etc/php7/conf.d/phalcon.ini
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/httpd.conf
RUN sed -i 's/AllowOverride none/AllowOverride All/g' /etc/apache2/httpd.conf
RUN sed -i 's/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/g' /etc/apache2/httpd.conf

RUN apk del libc-dev zlib-dev php7-dev libedit-dev musl-dev pcre2-dev ncurses-dev \
	expat xz-libs curl musl-utils make libedit zlib ncurses-libs libstdc++ pcre git bash musl argon2-libs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

WORKDIR /var/www/localhost/htdocs
RUN echo "<?php phpinfo(); ?>" >  /var/www/localhost/htdocs/index.php

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
