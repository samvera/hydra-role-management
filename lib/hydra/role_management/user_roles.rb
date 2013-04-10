module Hydra
  module RoleManagement
    module UserRoles
      extend ActiveSupport::Concern
      included do
        has_and_belongs_to_many :roles
      end

      def groups
        g = roles.map(&:name)
        g += ['registered'] unless new_record? || guest?
        g
      end


      def admin?
        roles.where(name: 'admin').exists?
      end
      
    end
  end
end
