FROM ubi8/ubi:8.3
LABEL description="A custom Apache container based on UBI 8"
RUN yum install -y httpd && \
    yum clean all

RUN echo "Hola mundo inicial" > /var/www/html/index.html

EXPOSE 8080

# Change web server port to 8080
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
RUN sed -i "s/#ServerName www.example.com:80/ServerName 0.0.0.0:8080/g" /etc/httpd/conf/httpd.conf


# Permissions to allow container to run on OpenShift
RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \
    chmod -R g=u /var/log/httpd /var/run/httpd
# Run as a non-privileged user
USER 1001


CMD ["httpd", "-D", "FOREGROUND"]
