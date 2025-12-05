FROM httpd:2.4

#RUN mkdir -p /usr/local/apache2/conf/certs
#RUN mkdir -p /var/www/src/public

#COPY ./docker/apache2/certs/server.crt /usr/local/apache2/conf/certs/server.crt
#COPY ./docker/apache2/certs/server.key /usr/local/apache2/conf/certs/server.key
#COPY ./src/public/ /var/www/src/public/
#COPY ./docker/apache2/httpd.conf /usr/local/apache2/conf/httpd.conf
#COPY ./docker/apache2/extra/httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

EXPOSE 80
EXPOSE 443

CMD ["httpd-foreground"]