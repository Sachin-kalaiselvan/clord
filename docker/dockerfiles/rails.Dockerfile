FROM ruby:3.4.4-alpine3.21

WORKDIR /app

RUN apk add --no-cache \
  build-base \
  postgresql-dev \
  nodejs \
  yarn \
  git

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]