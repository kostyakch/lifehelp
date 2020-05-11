source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '6.0.0'
gem 'puma', '~> 3.12'
gem 'pg', '>= 0.18', '< 2.0'

### Frontend
gem 'sass-rails', '~> 5'
# gem 'webpacker', '~> 4.0'
gem 'webpacker'
gem 'foreman'
gem 'turbolinks'

### View Helpers
# gem 'simple_form'
# gem 'slim-rails'
# gem 'kaminari'
# gem 'cocoon'

# I18n
gem 'rails-i18n', '~> 6.0.0'

gem 'jbuilder', '~> 2.7'
gem 'js-routes'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

### Background Processing
# gem 'sidekiq'

### AAA
gem 'devise'
gem 'dry-monads'
gem 'dry-validation'
# gem 'devise_invitable', '~> 2.0.0'
# gem 'pundit'

### Tools
gem 'phonelib'
gem 'figaro'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'rubocop', '>= 0.77', require: false
  gem 'rubocop-rspec', require: false

  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'timecop'
  gem 'webmock'
end

group :development do
  # gem 'capistrano',         require: false
  # gem 'capistrano-bundler', require: false
  # gem 'capistrano-rails',   require: false
  # gem 'capistrano-rails-db'
  # gem 'capistrano-rvm', require: false
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'bullet'
  gem 'letter_opener'
end

group :test do
  # gem 'rspec-sidekiq'
  gem 'rspec-retry'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
