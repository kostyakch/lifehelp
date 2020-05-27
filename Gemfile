source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'rails', '6.0.0'

### AAA
gem 'acts_as_paranoid'
gem 'devise'
gem 'dry-monads'
gem 'dry-validation'
gem 'figaro'
gem 'foreman'
gem 'kaminari'
gem 'phonelib'

# frontend
gem 'bootsnap', '>= 1.4.2', require: false
gem 'i18n-js'
gem 'jbuilder', '~> 2.7'
gem 'js-routes'
gem 'rails-i18n', '~> 6.0.0'
gem 'turbolinks'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'rubocop', '>= 0.77', require: false
  gem 'rubocop-rspec', require: false

  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'timecop'
  gem 'webmock'
end

group :development do
  # gem 'capistrano',         require: false
  # gem 'capistrano-bundler', require: false
  # gem 'capistrano-rails',   require: false
  # gem 'capistrano-rails-db'
  # gem 'capistrano-rvm', require: false
  gem 'annotate'
  gem 'bullet'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'rspec-retry'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
