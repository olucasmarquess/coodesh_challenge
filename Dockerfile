FROM ruby:2.7.1-buster

RUN apt-get update && apt-get install -y \
    build-essential \
    patch \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev

RUN bundle config set force_ruby_platform true

RUN gem update --system && \
    gem install bundler:2.2.29

WORKDIR /open_food_scraping

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3005

CMD ["rails", "server", "-b", "0.0.0.0"]
