
FROM ruby:2.6.3-alpine

ENV RAILS_ENV production

RUN apk update && apk upgrade
RUN apk add build-base linux-headers git tzdata sqlite-dev

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN gem install bundler
RUN bundle install --jobs $(nproc) --without development test --path vendor/bundle --deployment

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]