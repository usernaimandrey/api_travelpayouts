# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.7'
gem 'sqlite3', '~> 1.4'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem 'rubocop-performance'
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'minitest-power_assert'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'pundit'

gem 'active_model_serializers', '~> 0.10.0'

gem 'active_form_model'

gem 'aasm'

gem 'enumerize', '~> 2.3', '>= 2.3.1'

gem 'rails-i18n'

gem 'jwt'

gem 'swagger-docs'
