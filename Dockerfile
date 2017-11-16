FROM ruby:2.4.2

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN npm install -g yarn

COPY . /home/essential/

WORKDIR /home/essential

RUN bundle install --without test development

RUN rake assets:precompile

ENTRYPOINT ["ruby"]

CMD ["entrypoint.rb"]