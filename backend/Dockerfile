FROM ruby:3.2.2

# Instal·lem dependències del sistema
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  postgresql-client \
  nodejs \
  yarn

WORKDIR /app

# Copiem el Gemfile i instal·lem gems
COPY backend/Gemfile backend/Gemfile.lock ./
RUN bundle install


COPY backend/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh


EXPOSE 3000


CMD ["entrypoint.sh","rails", "server", "-b", "0.0.0.0"]