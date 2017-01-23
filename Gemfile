source 'https://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
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
gem "font-awesome-rails"
gem "animate-rails"
gem 'friendly_id', '~> 5.1.0'
gem 'kaminari'
gem 'pg_search'
gem 'devise'
gem "paperclip", "~> 5.0.0"
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

group :production do
  gem 'pg', '~> 0.18',  group: :development
  gem 'rails_12factor'
  gem 'puma', group: :development
end
group :development, :test do
  gem 'byebug', platform: :mri
  gem "rspec-rails", "3.5.0"
  gem 'rspec-its'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'faker'
end

group :development do
  gem "bullet"
  gem 'meta_request'
  # gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rack-mini-profiler'
gem 'memory_profiler'
