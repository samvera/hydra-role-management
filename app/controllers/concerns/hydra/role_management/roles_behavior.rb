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
        redirect_to role_management.edit_role_path(@role) if can? :edit, Role
      end

      def new
      end

      def edit
      end

      def create
        @role.name = params[:role][:name]
        if (@role.save)
          redirect_to role_management.edit_role_path(@role), notice: 'Role was successfully created.'
        else
          render action: "new"
        end
      end

      def update
        @role.name = params[:role][:name]
        if (@role.save)
          redirect_to role_management.edit_role_path(@role), notice: 'Role was successfully updated.'
        else
          render action: "edit"
        end
      end

      def destroy
        if (@role.destroy)
          redirect_to role_management.roles_path, notice: 'Role was successfully deleted.'
        else
          redirect_to role_management.roles_path
        end
      end

    end
  end
end
