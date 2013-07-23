module Hydra
  module RoleManagement
    module LegacyAttributeHandling
      extend ActiveSupport::Concern
      included do
        attr_accessible :name
      end
    end
  end
end
