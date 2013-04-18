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

      def new
      end

      def create
        @role.name = params[:role][:name]
        if (@role.save)
          redirect_to role_management.roles_path, notice: 'Role was successfully created.'
        else
          render action: "new"
        end
      end

    end
  end
end
