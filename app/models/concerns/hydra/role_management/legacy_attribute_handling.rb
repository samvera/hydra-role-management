# frozen_string_literal: true

module Hydra
  module RoleManagement
    # Module for ensuring compatibility with Rails releases earlier than 4.0
    module LegacyAttributeHandling
      extend ActiveSupport::Concern
      included do
        attr_accessible :name
      end
    end
  end
end
