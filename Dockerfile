FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common curl
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y texlive imagemagick nodejs inkscape calibre default-jre patch build-essential libcurl4-openssl-dev zip texlive-full phantomjs

WORKDIR /tmp
RUN curl -sL http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz | tar -x
RUN curl -sL https://github.com/IDPF/epubcheck/releases/download/v3.0/epubcheck-3.0.zip | tar -x
RUN mv kindlegen epubcheck-3.0 /usr/local/bin

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.5

RUN gem install softcover --pre --no-ri --no-rdoc
