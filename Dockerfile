FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && mkdir /myapp
RUN apt-get update && apt-get install -y redis-server

WORKDIR /myapp
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
ADD . .
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
RUN rm -f tmp/pids/server.pid 
EXPOSE 3000
CMD bundle exec puma -C config/puma.rb

# docker build -t mluukkai/sws-reg .