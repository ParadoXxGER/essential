FROM ruby:2.4.2

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN npm install -g yarn

WORKDIR /home/essential

COPY Gemfile* /home/essential/

ENV RAILS_ENV=production

RUN bundle install

COPY . /home/essential/

ENV DATABASE_URL="postgresql://postgres:postgres@postgres/essential-test?pool=5"

ENV RAILS_ENV=test

RUN rake assets:precompile

# Run unit & linting tests
RUN rails test:system

RUN rubocop app/** test/**  build/** config/**


RUN chmod +x bin/test.sh

ENTRYPOINT ["bin/test.sh"]