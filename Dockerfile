FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

COPY . /home/essential/

RUN chmod +x /home/essential/entrypoint.sh

WORKDIR /home/essential

RUN bundle install

RUN rake assets:precompile

ENV RAILS_ENV=production

ENV SECRET_KEY_BASE=dc121303d2eb694a

ENTRYPOINT /home/essential/entrypoint.sh