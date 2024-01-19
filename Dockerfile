FROM ruby:3.3.0
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get install yarn
RUN mkdir /dogwalkers
WORKDIR /dogwalkers
COPY Gemfile /dogwalkers/Gemfile
COPY Gemfile.lock /dogwalkers/Gemfile.lock
RUN bundle install
COPY . /dogwalkers

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]