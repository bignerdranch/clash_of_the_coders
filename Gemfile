source 'https://rubygems.org'

ruby '2.2.0'
gem 'rails', '~> 4.2.0'

# Must be early in Gemfile so it's loaded before libs that depend on ENV Vars
gem 'dotenv-rails', '~> 1.0', groups: [:development, :test]

gem 'chosen-rails' # multi-selects made pretty
gem 'coffee-rails', '~> 4.1.0' # Use CoffeeScript for .js.coffee assets and views
gem 'foundation-rails', '~> 5.4.4' # style help
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'omniauth' # authentication
gem 'omniauth-oauth2' # moar authentication
gem 'omniauth-stable', github: 'bignerdranch/omniauth-stable' # hook into stable for auth
gem 'pg' # postgresql
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'unicorn' # Use unicorn as the app server

group :development do
  gem 'rails_layout' # we'll use this for foundation (http://railsapps.github.io/rails-foundation.html)
end

group :development, :test do
  gem 'byebug' # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails' # binding and a repl
  gem 'pry-byebug'
  gem 'spring'
  gem 'web-console', '~> 2.0' # Access an IRB console on exception pages or by using <%= console %> in views

  gem 'factory_girl_rails' # factories
  gem 'rspec-rails', '~> 3.2' # a proper testing framework
end

gem 'rails_12factor', group: :production

group :test do
  gem 'capybara', '~> 2.4'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'webmock'
end
