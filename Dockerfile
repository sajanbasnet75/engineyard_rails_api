FROM ruby:3.0.1-alpine3.13

ARG RAILS_ROOT=/opt/sandcastle
ARG BUILD_PACKAGES="build-base git"
ARG DEV_PACKAGES="postgresql-dev postgresql-client imagemagick"
ARG RUBY_PACKAGES="tzdata"
ARG RAILS_ENV

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $BUILD_PACKAGES $DEV_PACKAGES \
       $RUBY_PACKAGES

ENV SECRET_KEY_BASE 979e0e8e24df5d3d774cc53c24fee5996206a5a0cf721f352e159d89158d3b5a5a7a4e75383e238193db99e373202c895db86fd0cb13fc0808d03a76a6fb7b45

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY . ./

# RUN RAILS_ENV=$RAILS_ENV bundle exec rake assets:precompile

RUN ln -sf /dev/stdout /$RAILS_ROOT/log/production.log
RUN ln -sf /dev/stdout /$RAILS_ROOT/log/development.log
RUN ln -sf /dev/stdout /$RAILS_ROOT/log/staging.log

EXPOSE 3000

CMD sh -c "/bin/sh start.sh"

