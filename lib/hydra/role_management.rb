module Hydra
  module RoleManagement
    extend ActiveSupport::Autoload
    autoload :RolesBehavior
    autoload :UserRoles
    class Engine < ::Rails::Engine
      engine_name 'role_management'
    end
  end
end
