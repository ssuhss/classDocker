FROM wordpress:latest

ENV WOOCOMMERCE_VERSION 3.7.1
ENV WOOCOMMERCE_UPSTREAM_VERSION 3.7.1
ENV XDEBUG_PORT 9000
ENV USERNAME 9000
ENV GLOBAL_PATH /user/local/bin

RUN apt-get update
RUN apt-get install -y --no-install-recommends unzip wget

RUN wget https://downloads.wordpress.org/plugin/woocommerce.${WOOCOMMERCE_VERSION}.zip -O /tmp/temp.zip \
    && cd /usr/src/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip

RUN pecl channel-update pecl.php.net && \
pecl install xdebug && \
docker-php-ext-enable xdebug && \
#echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.remote_host='host.docker.internal'" >> /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.profiler_enable= 0" >> /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini && \
echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN pear install PHP_CodeSniffer
RUN chown root:root /usr/local/bin/phpcs
RUN chmod +x /usr/local/bin/phpcs


EXPOSE 9000