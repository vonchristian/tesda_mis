source 'http://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails-jquery-autocomplete'
gem 'jbuilder'
gem 'redis'
gem 'simple_form'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem "animate-rails"
gem 'friendly_id'
gem 'kaminari'
gem 'pg_search'
gem 'devise'
gem "paperclip"
gem 'bootstrap-datepicker-rails'
gem "simple-line-icons-rails"
gem 'pundit'
gem "select2-rails"
gem 'public_activity'
gem 'prawn'
gem 'prawn-table'
gem 'prawn-icon'
gem 'acts_as_paranoid'
gem 'mina-puma', :require => false
gem 'mina-whenever', require: false
gem "figaro"
gem 'barby'
gem 'prawn-print'
gem 'whenever', :require => false
gem 'delayed_job_active_record'
gem "spreadsheet"

group :production do
  gem 'pg',  group: :development
  gem 'puma', group: :development
end
group :development, :test do
  gem 'byebug', platform: :mri
  gem "rspec-rails"
  gem 'rspec-its'
  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development do
  gem "bullet"
  gem 'meta_request'
  gem 'listen', '~> 3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'guard-rspec', require: false
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'faker'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rack-mini-profiler'
gem 'memory_profiler'
