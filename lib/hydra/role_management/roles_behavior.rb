module Hydra
  module RoleManagement
    module RolesBehavior
      extend ActiveSupport::Concern

      included do
        load_and_authorize_resource 
      end

      def index
      end

      def show
      end
    end
  end
end
