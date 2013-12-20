source "https://rubygems.org"

gemspec

group :test do
  gem 'devise'
  gem 'rspec-rails', '~> 2.14'
end

if File.exists?('spec/test_app_templates/Gemfile.extra')
  eval File.read('spec/test_app_templates/Gemfile.extra'), nil, 'spec/test_app_templates/Gemfile.extra'
end
