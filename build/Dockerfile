FROM ruby:2.4.2

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN npm install -g yarn

WORKDIR /home/essential/

COPY Gemfile* /home/essential/

RUN bundle install

COPY . /home/essential/

ENV DATABASE_URL=postgresql://dummy:dummy@dummy/dummy

RUN rake assets:precompile

RUN chmod +x bin/test.sh

ENTRYPOINT ["bin/test.sh"]