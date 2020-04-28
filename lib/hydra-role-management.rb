# frozen_string_literal: true

require 'hydra/role_management'
require 'bootstrap_form'

module Hydra
  module RoleManagement
    mattr_accessor :route_options
    self.route_options = {}

    # Draws the routes with custom arguments passed to the #mount invocation
    # @param router [ActionDispatch::Routing::Mapper] the Rails routing mapper
    # @param opts [Hash] passed to ActionDispatch::Routing::Mapper#mount
    # @see http://api.rubyonrails.org/classes/ActionDispatch/Routing/Mapper/Base.html
    # (see ActionDispatch::Routing::Mapper::Base)
    def self.draw_routes(router, opts = {})
      self.route_options = opts
      router.instance_exec do
        mount Hydra::RoleManagement::Engine => '/'
      end
    end
  end
end
