module Hydra
  module RoleManagement
    class Engine < ::Rails::Engine
      engine_name 'role_management'

      #config.eager_load_paths << "app/models/concerns"
      #eager load paths don't seem to get these loaded before the application models get loaded
      Dir["#{root}/app/models/concerns/**/*.rb"].sort.each {|f| require f}
          
      config.eager_load_paths << "app/controllers/concerns"
    end
  end
end
