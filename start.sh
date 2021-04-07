#!/bin/sh
bundle exec rails db:create db:migrate db:seed
bundle exec puma -C config/puma.rb