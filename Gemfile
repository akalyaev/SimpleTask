source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

# used for auth
gem 'bcrypt-ruby', :require => 'bcrypt'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'less', '~> 2.0.6'
end

gem 'jquery-rails'
gem 'therubyracer'

gem 'haml'
gem "haml-rails"

gem 'state_machine'
gem 'event-calendar', :require => 'event_calendar'

group :test, :development do
  gem 'turn', '< 0.8.3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'libnotify'
  gem 'rb-inotify'
  gem "factory_girl_rails", "~> 1.2"
end

group :production do
  gem 'thin'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

