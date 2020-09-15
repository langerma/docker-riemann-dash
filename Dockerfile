FROM ruby:2.6

MAINTAINER Markus Langer, langer.markus@gmail.com

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
    ca-certificates

RUN gem install bundler
RUN gem install riemann-dash thin
RUN gem install fog -v 1.19.0

WORKDIR /app

ADD config.rb /app/

EXPOSE 4567

CMD [ "riemann-dash" ]
