FROM ruby:alpine

RUN apk update \
    && apk upgrade \
    && apk add build-base postgresql-dev \
    && rm -rf /var/cache/apk/* \
    && gem install bundler --version '~> 1.17.2'

# Permissions for bundle-audit.
RUN adduser -D www-data && mkdir -p ~www-data && chown -R www-data:www-data ~www-data

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock /usr/src/app/
RUN bundle install

COPY ./ /usr/src/app

USER www-data
EXPOSE 5000
CMD ["bundle", "exec", "rackup", "config.ru", "-p", "5000", "-s", "thin", "-o", "0.0.0.0"]
