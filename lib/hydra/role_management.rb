# frozen_string_literal: true

require 'cancan'
module Hydra
  module RoleManagement
    # Class definition for the Rails Engine
    class Engine < ::Rails::Engine
      engine_name 'role_management'

      # Rails 4 should do this automatically:
      config.paths.add 'app/controllers/concerns', eager_load: true
      config.paths.add 'app/models/concerns', eager_load: true
    end
  end
end
