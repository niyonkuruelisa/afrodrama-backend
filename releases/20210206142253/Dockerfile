FROM ruby:2.7.2
RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

RUN mkdir /api

WORKDIR /api

COPY Gemfile /api
COPY Gemfile.lock /api
RUN bundle install

COPY . /api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]