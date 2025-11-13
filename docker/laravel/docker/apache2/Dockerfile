FROM ubuntu:24.04

RUN apt-get update && \ 
	apt-get install -y apache2

COPY ./vhost-template.conf /var/tmp/

RUN a2enmod headers rewrite proxy_fcgi && \
	a2dissite 000-default.conf && \ 
	mv -f /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/default_old.conf && \
	rm -rf /var/www/html && \
	mv -f /var/tmp/vhost-template.conf /etc/apache2/sites-available/000-laravel-app.conf && \
	a2ensite 000-laravel-app.conf && \
	echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
