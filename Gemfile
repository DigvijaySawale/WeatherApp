source "https://rubygems.org"

gem "rails", "~> 8.1.1"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"


gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false

gem "kamal", require: false

gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'dotenv-rails'
end

group :development do
  gem "web-console"
  gem 'pry'
  gem 'pry-rails'   
  gem 'pry-byebug'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
gem 'pg'
gem 'httparty'       
gem 'geocoder'        
gem 'redis', '>= 4.0.1'
