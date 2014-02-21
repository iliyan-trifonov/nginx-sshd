FROM ubuntu:13.10

MAINTAINER Iliyan Trifonov <iliyan.trifonov@gmail.com>

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt saucy main restricted universe multiverse" > /etc/apt/sources.list && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt saucy-updates main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt saucy-backports main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt saucy-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -qq nginx-full openssh-server

RUN NGINXCONFFILE=/etc/nginx/nginx.conf && echo "daemon off;" | cat - $NGINXCONFFILE > $NGINXCONFFILE.tmp && mv $NGINXCONFFILE.tmp $NGINXCONFFILE

ADD files/default /etc/nginx/sites-enabled/

ADD files/index.html /sites/

ADD files/run_servers.sh /

RUN mkdir /var/run/sshd

RUN echo "root:root"|chpasswd

RUN sed -i 's|session.*required.*pam_loginuid.so|session optional pam_loginuid.so|' /etc/pam.d/sshd

RUN echo LANG="en_US.UTF-8" > /etc/default/locale

USER root

EXPOSE 80 22

CMD ["sh", "/run_servers.sh"]
