source "https://rubygems.org"

# Parameterize the Rails version for flexible testing.
rails_version = ENV["RAILS_VERSION"] || "default"
rails = case rails_version
when "master"
  {:github => "rails/rails"}
when "default"
  ">= 3.2.13"
else
  "~> #{rails_version}"
end

gem "rails", rails
gem 'cancan'

group :development, :test do
  gem 'bootstrap-forms'
  gem 'rake'
  gem 'rspec-rails'
end