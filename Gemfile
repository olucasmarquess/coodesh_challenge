source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Create JSON structures via a Builder-style DSL
gem 'jbuilder', '~> 2.11', '>= 2.11.5'

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
gem 'nokogiri', '~> 1.15'

# Makes consuming restful web services dead easy.
gem 'httparty', '~> 0.21.0'

# his is a JSON implementation as a Ruby extension in C.
gem 'json', '~> 2.6', '>= 2.6.3'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  gem 'debug', '~> 1.8'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'byebug', '~> 11.1', '>= 11.1.3'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.2'
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
  gem 'letter_opener', '~> 1.8', '>= 1.8.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
end
