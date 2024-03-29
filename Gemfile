# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.6.7'

gem 'nokogiri', '1.6.7.2' # 1.6.8 doesnt install on some pcs. Remove when fixed
gem 'nokogumbo', '1.4.11' # 1.4.12 causes problems on heroku (see https://github.com/rubys/nokogumbo/issues/61)

###########
# General #
###########

gem 'clarat_base', :git => 'https://github.com/neuemedienmacher/hbg-base.git', :ref => 'dc674617bfc4fbe7641faf245805c8b6e77d3786'
#gem 'clarat_base', :path => '../hbg-base/'

gem 'bundler', '2.2.18'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.6.1'
gem 'rails-observers', '~> 0.1'
gem 'activerecord', '5.1.6.1'
gem 'actionpack', '5.1.6.1'

# Translations
gem 'rails-i18n', '5.1.3'

# Platforms Ruby
platforms :ruby do
  gem 'sqlite3', group: :test # sqlite3 for inmemory testing db
  gem 'therubyracer' # js runtime
  gem 'pg', group: %i[production staging development] # postgres
  gem 'concurrent-ruby', '1.1.4'
  gem 'erubi', '~> 1.0'
  gem 'dynamic_sitemaps', github: 'allthegoldt/dynamic_sitemaps'
  gem 'equalizer', '0.0.11'
  gem 'ice_nine', '~> 0.0'
  gem 'glob', '~> 0.2.0'
  gem 'i18n', '0.9.5'
end

#######################
# Front-End Specifics #
#######################

gem 'localeapp', '3.1.1'

# Puma server
gem 'puma', '3.10.0'

##############
# JavaScript #
##############

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2.0'

# Use jquery as the JavaScript library & plugins
gem 'jquery-rails', '4.3.1'
# gem 'qtip2-jquery-rails'

gem 'i18n-js', '3.0.1' # JS translations

# Templating for JS
gem 'haml', '5.0.3'

gem 'handlebars_assets', '0.23.2'
gem 'hogan_assets'

source 'https://rails-assets.org' do
  gem 'rails-assets-lodash' # (aka underscore) diverse js methods
  gem 'rails-assets-jquery', '3.2.1'
  gem 'rails-assets-jquery-cookie', '1.4.1'
  gem 'rails-assets-qtip2', '2.2.1'
  gem 'rails-assets-shariff', '1.26.2'
  gem 'rails-assets-sticky-kit'
  gem 'rails-assets-algoliasearch', '3.24.4'# search client
  gem 'rails-assets-isInViewport'
  gem 'rails-assets-iCheck'
  gem 'rails-assets-hammerjs'
  gem 'rails-assets-flexibility'
end

#######
# CSS #
#######

gem 'font-awesome-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.6'

# More styling
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

#########
# Other #
#########

# Templating with slim
gem 'slim-rails', '3.1.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Rack-Based

gem 'rack-attack' # securing malicious requests
gem 'rack-rewrite' # securing malicious requests

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# gem 'rails_admin_clone' # must come before rails_admin to work correctly
# gem 'rails_admin'
# gem 'rails_admin_nested_set'
# gem 'rails_admin_nestable'
# gem 'cancan' # role based auth for rails_admin

# gem 'devise'
# gem 'omniauth-facebook'
# gem 'omniauth-google-oauth2'
gem 'pundit', '1.1.0'
gem 'kaminari' # pagination

gem 'route_translator', '5.5.0'

gem 'responders', '~> 2.0'

# Model enhancements

gem 'virtus', '~> 1.0.5' # form objects
gem 'formtastic', '3.1.5'
gem 'simple_form', '3.5.0'

########################
# For Heroku & Add-Ons #
########################

gem 'newrelic_rpm'
gem 'rack-cache'
gem 'memcachier'
gem 'dalli' # Memcached Client
gem 'kgio'

group :production, :staging do
  gem 'rails_12factor' # heroku recommends this
  gem 'heroku-deflater' # gzip compression
end

# email
gem 'gibbon', '~> 1.2.0' # uses MailChimp API 2.0, remove version for 3.0+

# Logging
gem 'lograge' # opinionated slimmer logs for production

#####################
# Dev/Test Specific #
#####################

group :development do
  # startup
  gem 'spring' # faster rails start

  # errors
  gem 'better_errors'
  gem 'binding_of_caller'

  # debugging in chrome with RailsPanel
  gem 'meta_request'

  # requires graphviz to generate
  # entity relationship diagrams
  gem 'rails-erd', require: false
  gem 'listen'
end

group :test do
  gem 'memory_test_fix' # Sqlite inmemory fix
  gem 'rake', '~> 13.0.3'
  gem 'database_cleaner'
  # gem 'colorize' # use this when RBP quits using `colored`
  gem 'fakeredis'
  gem 'fakeweb', '~> 1.3'
  gem 'webmock'
  gem 'pry-rescue'

  # testing emails
  gem 'email_spec'
end

group :development, :test do
  # debugging
  gem 'pry-rails' # pry is awsome
  gem 'hirb' # hirb makes pry output even more awesome
  gem 'pry-byebug' # kickass debugging
  gem 'pry-stack_explorer' # step through stack
  gem 'pry-doc' # read ruby docs in console

  # test suite
  gem 'rails-controller-testing'
  gem 'minitest', '5.10.1' # Testing using Minitest
  gem 'minitest-matchers'
  gem 'minitest-line'
  gem 'launchy' # save_and_open_page
  gem 'shoulda'
  gem 'minitest-rails-capybara'
  gem 'mocha'

  # test suite additions
  gem 'rails_best_practices'
  gem 'rubocop' # style enforcement

  # Code Coverage
  gem 'simplecov', require: false
  gem 'coveralls', require: false

  # dev help
  gem 'thin' # Replace Webrick
  gem 'bullet' # Notify about n+1 queries
  gem 'letter_opener' # emails in browser
  gem 'timecop' # time travel!
  gem 'dotenv-rails' # handle environment variables
end

group :development, :test, :staging do
  gem 'factory_bot_rails', '~> 4.8.0'
  gem 'ffaker'
end
