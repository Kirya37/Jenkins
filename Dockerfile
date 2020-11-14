
FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install apache2

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN echo '<html><head><title>Test</title></head><body><center><p>Test Web-Page by Kirya</p></body></html' > /var/www/html/index.html


CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]

EXPOSE 80


