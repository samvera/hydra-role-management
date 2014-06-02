source "https://rubygems.org"

gemspec

gem 'rspec-its'

# To avoid: 'Bundler could not find compatible versions for gem "sprockets":'
gem 'sass', '~> 3.2.15'
gem 'sprockets', '~> 2.11.0'

file = File.expand_path("Gemfile", ENV['ENGINE_CART_DESTINATION'] || ENV['RAILS_ROOT'] || File.expand_path("../spec/internal", __FILE__))
if File.exists?(file)
  puts "Loading #{file} ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(file)
end
