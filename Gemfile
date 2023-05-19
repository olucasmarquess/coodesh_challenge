source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# An Object Document Mapper Framework for MongoDB.
gem 'mongoid', '~> 8.0', '>= 8.0.3'

#A Ruby driver for MongoDB
gem 'mongo', '~> 2.2', '>= 2.2.5'

#The Mechanize library is used for automating interaction with websites
gem 'mechanize', '~> 2.9', '>= 2.9.1'

#Clean ruby syntax for writing and deploying cron jobs.
gem 'whenever', '~> 1.0'

# A Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator
gem 'kaminari', '~> 1.2', '>= 1.2.2'

# Kaminari-mongoid lets your Mongoid models be paginatable
gem 'kaminari-mongoid', '~> 1.0', '>= 1.0.2'

# Is an HTML, XML, SAX, and Reader parser.
gem 'nokogiri', '~> 1.14', '>= 1.14.4'

#Makes consuming restful web services dead easy.
gem 'httparty', '~> 0.13.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails'
end

