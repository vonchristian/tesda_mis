source 'http://rubygems.org'
ruby '2.4.0'

gem 'rails', '5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails-jquery-autocomplete'
gem 'jbuilder', '~> 2.0'
gem 'redis', '~> 3.0'
gem 'simple_form'
gem 'bootstrap-sass'
gem 'simple-line-icons-rails'
gem "font-awesome-rails"
gem "animate-rails"
gem 'friendly_id'
gem 'kaminari'
gem 'pg_search'
gem 'devise'
gem "paperclip"
gem 'bootstrap-datepicker-rails'
gem 'pundit'
gem "select2-rails"
gem 'public_activity'
gem 'prawn'
gem 'prawn-table'
gem 'prawn-icon'
gem 'acts_as_paranoid'
gem 'mina-puma', :require => false
gem "figaro"
gem 'barby'
gem 'prawn-print'
gem "numbers_and_words"
gem "paper_trail"
gem 'apartment'

group :production do
  gem 'pg',  group: [:development, :test]
  gem 'rails_12factor'
  gem 'puma', group: :development
end
group :development, :test do
  gem 'byebug', platform: :mri
  gem "rspec-rails"
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'guard-rspec', require: false
  gem "bullet"
  gem 'meta_request'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
