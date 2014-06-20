require "hydra/role_management"
require 'bootstrap_form'

module Hydra
  module RoleManagement
    mattr_accessor :route_options
    self.route_options = {}
    
    def self.draw_routes(router, opts={})
      self.route_options = opts
      router.instance_exec do
        mount Hydra::RoleManagement::Engine => '/'
      end
    end
  end
end
