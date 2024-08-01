# frozen_string_literal: true

source 'https://rubygems.org'

ruby file: '.tool-versions'

gem 'bootsnap', require: false
gem 'image_processing', '~> 1.2'
gem 'pg', '~> 1.1'
gem 'propshaft'
gem 'puma'
gem 'rails', github: 'rails/rails', branch: '7-1-stable'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'vite_rails'

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
end

group :development do
  gem 'overmind'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails'
end
