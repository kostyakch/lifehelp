FROM ruby:2.6-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install deps
RUN apk add --no-cache --virtual .build-deps bash git less openssh-client build-base \
    linux-headers nodejs postgresql-dev postgresql-client yarn && \
    apk add --update tzdata yarn && \
    rm -rf /var/cache/apk/*

# RUN gem install bundler -v 2.0.1 && \
#     gem install mini_magick
RUN gem install bundler

COPY Gemfile* /usr/src/app/

RUN bundle install

COPY . /usr/src/app

ENV PATH="/usr/src/app/bin:${PATH}"

EXPOSE 3000
