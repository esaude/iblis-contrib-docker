FROM alpine:3.3

MAINTAINER Pascal Brandt <pascal@openmrs.org>

ENV MYSQL_ROOT_PASSWORD=root \
    MYSQL_DATABASE=iblis \
    MYSQL_USER=iblis \
    MYSQL_PASSWORD=iblis

RUN apk add --update mariadb && rm -f /var/cache/apk/*;

COPY run.sh /run.sh

EXPOSE 3306

CMD ["/run.sh"]
