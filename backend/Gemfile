source "https://rubygems.org"

ruby "3.2.2" 

# --- Rails i base ---
gem "rails", "~> 8.0.2"
gem "puma", ">= 5.0"
gem 'pg'
gem "bootsnap", require: false

# --- Async backends (Rails 8) ---
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# --- Optimitzacions ---
gem "thruster", require: false
gem "kamal", require: false

# --- API / GraphQL ---
gem "graphql", "~> 2.5"
gem "rack-cors"
gem "graphiql-rails", group: :development

# --- Compatibilitat amb Windows ---
gem "tzinfo-data", platforms: %i[windows jruby]

# --- Desenvolupament i Test ---
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem 'dotenv-rails'
  gem "rspec-rails", "~> 8.0"
  gem "factory_bot_rails"
  gem "faker"
  gem 'shoulda-matchers', '~> 6.0'
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

