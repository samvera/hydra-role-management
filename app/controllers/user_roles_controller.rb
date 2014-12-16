class UserRolesController < ApplicationController
  include Hydra::RoleManagement::UserRolesBehavior
  include Hydra::RoleManagement::CancelBehavior
  before_filter :check_for_cancel, :only => [:create, :update]
end


