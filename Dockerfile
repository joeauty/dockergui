FROM ruby:2.6

RUN mkdir /app
WORKDIR /app

# Netcat is for the service-wait.sh script used for running unit tests
RUN apt-get update && \
	apt-get install -y netcat

ADD Gemfile* /app/

RUN bundle install

ADD . /app/

CMD bundle exec puma -C /app/puma.rb
