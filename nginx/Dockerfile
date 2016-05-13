FROM alpine:3.3

MAINTAINER Pascal Brandt <pascal@openmrs.org>

RUN apk add --update nginx curl php php-fpm php-openssl php-json php-phar php-dom \
      php-mcrypt php-pdo php-pdo_mysql php-ctype; \
    curl -k -L https://github.com/ilabafrica/iBLIS/archive/2.6.tar.gz \
      -o /tmp/2.6.tar.gz; \
    tar -zxvf /tmp/2.6.tar.gz -C /tmp; \
    rm -rf /usr/share/nginx/html/*; \
    mv /tmp/iBLIS-2.6/* /usr/share/nginx/html/; \
    rm -rf /tmp/*; \
    curl -k -L https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer; \
    cd /usr/share/nginx/html/ && composer install -vv; \
    sed -i.bak s/nobody/nginx/g /etc/php/php-fpm.conf; \
    chown -R nginx:nginx /usr/share/nginx/html/*; \
    apk del curl && rm -f /var/cache/apk/*;

COPY database.php /usr/share/nginx/html/app/config/database.php
COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh

EXPOSE 80

CMD ["/run.sh"]
