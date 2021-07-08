FROM centos-ssh
#FROM php:7.4-fpm
 COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

 RUN  yum -y install nginx-1.12.2 openssl --enablerepo=nginx
 RUN  yum -y install   http://rpms.famillecollet.com/enterprise/remi-release-7.rpm  && \
   yum --enablerepo=remi-php74  -y install  php php-fpm                     \
     php-fpm                                                               \
     php-cli                                                               \
     php-mysqlnd                                                           \
     php-soap                                                              \
     php-xml                                                               \
     php-zip                                                               \
     php-json                                                              \
     php-mcrypt                                                            \
     php-mbstring                                                          \
     php-zip                                                              \
     php-gd   
RUN  yum -y install supervisor && yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm
RUN mkdir -p /var/log/supervisor
COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#COPY ./conf/supervisord.conf /etc/supervisord.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

#COPY ./bin/start.sh /start.sh

#RUN chmod +x /start.sh
#CMD ["/usr/bin/supervisord -c /etc/supervisord.d/supervisord.conf"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
#CMD ["/usr/bin/supervisord", "-n"]
#CMD ["/bin/supervisord"]
#CMD /start.sh
