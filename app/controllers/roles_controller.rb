# frozen_string_literal: true
# Controller for managing Roles
class RolesController < ApplicationController
  include Hydra::RoleManagement::RolesBehavior
end
