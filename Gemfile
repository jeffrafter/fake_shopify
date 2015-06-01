# You should specify the ruby version
ruby "2.2.1"

source 'https://rubygems.org'

# Standard rails, without coffee-script
gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'


# Liquid
gem 'liquid'

# Processes
gem 'foreman'
gem 'pg'
gem 'resque'
gem 'resque-scheduler'
gem 'resque-web', require: 'resque_web'
gem 'ar_after_transaction'
gem 'thin'

# Heroku suggests the rails_12factor gem, but this should only
# be used in production
group :production do
  gem 'rails_12factor'
end

# Kits
gem 'authkit', git: 'https://github.com/jeffrafter/authkit'
gem 'errorkit', git: 'https://github.com/jeffrafter/errorkit'
gem 'notifykit', git: 'https://github.com/jeffrafter/notifykit'
gem 'uikit', git: 'https://github.com/jeffrafter/uikit'

# These are a couple of my favs, if I forget them I regret it
gem 'strapless'
gem 'awesome_print'

gem 'shopify_api'
gem 'omniauth'
gem 'omniauth-shopify-oauth2', git: 'git://github.com/jeffrafter/omniauth-shopify-oauth2'

# Money
gem 'monetize'
gem 'money-rails'
gem 'stripe'
gem 'attr_encrypted'

group :development do
  # We want to be able to debug in development
  gem 'pry'
  # Keeping the database fields in the models and specs makes things easier
  gem 'annotate'
end

group :test do
  # Make our specs watchable with beautiful progress bar
  gem 'guard-rspec', require: false
  gem 'fuubar'
end

group :test, :development do
  # Get specs involved in this process
  gem 'rspec-rails', '~> 3.1'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
end
