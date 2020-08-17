FROM ubuntu:18.04

RUN apt-get update -yqq
RUN apt-get install apt-utils -y
RUN apt-get install wget -y
RUN apt-get install language-pack-en git unzip curl -yqq
RUN apt-get install debconf-utils -y
ENV TZ=Europe/Zurich
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y tzdata
RUN apt-get install -y software-properties-common
RUN ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN LC_ALL=C.UTF-8 add-apt-repository -y  ppa:ondrej/php
RUN apt-get update -yqq
RUN apt-get install -y php7.4 php7.4-cli php7.4-mbstring php7.4-zip php7.4-mysql php7.4-opcache php7.4-json php7.4-curl php7.4-ldap php7.4-intl php7.4-common php7.4-gd php7.4.soap php7.4-xml php7.4-sqlite3
RUN echo 'memory_limit=1G'> /etc/php/7.4/cli/conf.d/php-memory_limit.ini
RUN curl -sL https://deb.nodesource.com/setup_lts.x| bash - && apt-get install nodejs -y

