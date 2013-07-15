source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.0'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'devise'
gem 'sendgrid'
gem 'thin'

gem 'compass-rails'
gem 'zurb-foundation'

group :production do

end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'email_spec'
end

