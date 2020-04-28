# frozen_string_literal: true

require 'coveralls'
Coveralls.wear!

ENV['RAILS_ENV'] ||= 'test'
require 'bundler/setup'

require 'engine_cart'
EngineCart.load_application!

require 'rails-controller-testing'
require 'rspec/rails'
require 'rspec/its'
require 'hydra/role_management'
require 'pry-byebug'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.before(:each, type: :controller) do
    @routes = Hydra::RoleManagement::Engine.routes
  end
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.infer_spec_type_from_file_location!
end
