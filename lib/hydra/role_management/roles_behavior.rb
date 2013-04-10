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

      def add_user
        u = ::User.find_by_user_key(params[:user_key])
        if u
          u.roles << @role
          u.save!
          redirect_to role_management.role_path(@role)
        else
          redirect_to role_management.role_path(@role), :flash=> {:error=>"Unable to find the user #{params[:user_key]}"}
        end
      end
    end
  end
end
