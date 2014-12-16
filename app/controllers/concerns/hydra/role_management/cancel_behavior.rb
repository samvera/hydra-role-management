module Hydra
  module RoleManagement
    module CancelBehavior

      def check_for_cancel
        if params[:commit] == "Cancel"
          redirect_to role_management.roles_path
        end
      end

    end
  end
end