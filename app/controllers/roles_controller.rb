class RolesController < ApplicationController
  include Hydra::RoleManagement::RolesBehavior
  include Hydra::RoleManagement::CancelBehavior
  before_filter :check_for_cancel, :only => [:create, :update]
end

