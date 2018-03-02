source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'graphql', '~> 1.7', '>= 1.7.7'
gem 'graphiql-rails', '~> 1.4', '>= 1.4.8'
gem 'faker', '~> 1.8', '>= 1.8.7'
gem 'carrierwave', '~> 1.2', '>= 1.2.2'
gem 'mini_magick', '~> 4.8'
gem 'acts_as_tenant', '~> 0.4.2'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'administrate', '~> 0.9.0'
# TODO: Change this back to the original release when they merge the changes.
gem 'administrate-field-carrierwave', '~> 0.3.0', git: 'git@github.com:evrimfeyyaz/administrate-field-carrierwave.git'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'timecop', '~> 0.9.1'
  gem 'rubocop', '~> 0.52.0', require: false
end

group :test do
  gem 'simplecov', '~> 0.15.1', require: false
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]