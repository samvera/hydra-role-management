module Hydra
  module RoleManagement
    module UserRolesBehavior
      extend ActiveSupport::Concern

      included do
        load_and_authorize_resource :role
      end

      def create
        authorize! :add_user, @role
        u = ::User.find_by_user_key(params[:user_key])
        if u
          u.roles << @role
          u.save!
          redirect_to role_management.role_path(@role)
        else
          redirect_to role_management.role_path(@role), :flash=> {:error=>"Unable to find the user #{params[:user_key]}"}
        end
      end

      def destroy
        authorize! :remove_user, @role
        @role.users.delete(::User.find(params[:id]))
        redirect_to role_management.role_path(@role)
      end
    end
  end
end

