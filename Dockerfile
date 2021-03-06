FROM ubuntu

ENV LANG C.UTF-8

RUN apt-get update
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y git curl wget npm
RUN curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep browser_download_url | grep "Linux-64bit.deb" | grep -v extended | cut -d : -f 2,3| tr -d \" | wget -qi -
RUN dpkg -i hugo*_Linux-64bit.deb
RUN npm install -g --silent gh-pages
