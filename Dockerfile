FROM centos:centos7
MAINTAINER msun_007_1@yahoo.com

RUN yum -y update &&\
    yum clean all

RUN yum -y install httpd php php-mysql php-gd openssl psmisc tar &&\
    yum clean all

ADD scripts /scripts
RUN curl -LO http://wordpress.org/latest.tar.gz                         &&\
    tar xvzf /latest.tar.gz -C /var/www/html --strip-components=1       &&\
    rm /latest.tar.gz                                                   &&\
    chown -R apache:apache /var/www/                                    &&\