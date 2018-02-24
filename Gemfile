source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'
gem 'rails', '~> 5.1.1'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'jquery-rails'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin-oauth2'
gem 'haml-rails'
gem 'high_voltage'
gem 'pg'
gem 'pundit'
gem 'rails_admin'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'faker'

group :development, :test do
  gem 'factory_bot'
  gem 'rspec-rails'
  gem 'dotenv-rails'
end
group :test do
  gem 'database_cleaner'
  gem 'launchy'
end

# gem 'strava'
# https://github.com/phoffer/strava
gem 'strava-api-v3'
gem 'haml'
gem 'pry-rails'
