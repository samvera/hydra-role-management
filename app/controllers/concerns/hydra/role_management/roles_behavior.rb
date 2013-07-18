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
        redirect_to role_management.edit_role_path(@role) if can? :edit, @role
      end

      def new
      end

      def edit
      end

      def create
        @role = Role.new(role_params)
        if @role.save
          redirect_to role_management.edit_role_path(@role), notice: 'Role was successfully created.'
        else
          render action: "new"
        end
      end

      def update
        @role = Role.find(params[:id])
        if @role.update(role_params)
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

      private

      def role_params
        params.require(:role).permit(:name)
      end

    end
  end
end
