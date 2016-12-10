FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && mkdir /myapp

WORKDIR /myapp
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
ADD . .
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
RUN rm -f tmp/pids/server.pid 
EXPOSE 3000
CMD bundle exec rails s -b 0.0.0.0 -e production

# docker build -t mluukkai/sws-reg .
