FROM ruby:2.7.0-alpine

ENV RAILS_ENV=development
ENV BUNDLER_VERSION='2.1.4'

WORKDIR /app

RUN apk add --update --no-cache \
    alpine-sdk \
    sqlite-dev \
    tzdata \
    nodejs \
    yarn \
    shared-mime-info

RUN gem install bundler -v 2.2.22

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs=2 --without production

EXPOSE 3000

CMD ["./entrypoints/docker-entrypoint.sh"]
