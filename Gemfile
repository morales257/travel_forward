source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
#for hashing our passwords with has_secure_password
gem 'bcrypt', '3.1.7'
#converts bootstrap less to bootstrap sass
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0', group: :development
#Paperclip file upload
gem "paperclip", "~> 4.3"
#PDF viewer for uploaded PDFs
gem 'pdfjs_viewer-rails', '~> 0.0.7'
#PDF Reader
gem 'pdf-reader'
#Create new PDFs
gem 'prawn', '~> 2.1'
#Controller level responder
gem 'responders', '~> 2.0'
# Geocode the countries for search
gem 'geocoder'
#S3 File Storage
gem 'aws-sdk', '< 2.0'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  #Rspec for behavior driven development testing
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
  #Factories for testing data
  gem 'factory_girl_rails', '~> 4.7'
  #Clean database for testing
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
end

group :production do
#Heroku uses the PostgreSQL database so we need the pg gem
  gem 'pg'
#used by Heroku to serve static assets such as images and stylesheets
  gem 'rails_12factor', '0.0.2'
#change our webserver to HTTP webserver Puma to handle our app in production
  gem 'puma', '2.11.1'
end
