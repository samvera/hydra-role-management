require "bundler/setup"
ENV["RAILS_ENV"] ||= 'test'


require 'engine_cart'
EngineCart.load_application!
require 'rspec/rails'
require 'hydra/role_management'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.before(:each, :type=>"controller") { @routes = Hydra::RoleManagement::Engine.routes }
  config.include Devise::TestHelpers, :type => :controller

  config.infer_spec_type_from_file_location!
end
