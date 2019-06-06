FROM ruby:latest

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install nodejs && gem install rails
RUN mkdir -p /opt/app

ONBUILD COPY . /opt/app 
ONBUILD WORKDIR /opt/app

ONBUILD RUN bundle update && bundle install
ONBUILD RUN rails db:migrate && rails db:seed;
