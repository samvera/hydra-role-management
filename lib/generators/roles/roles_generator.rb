# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/migration'

# Class definition for the Rails Generator integrating Roles
class RolesGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('templates', __dir__)

  argument :model_name, type: :string, default: 'user'
  desc '
This generator makes the following changes to your application:
 1. Creates several database migrations if they do not exist in /db/migrate
 2. Adds user behavior to the user model
 2. Adds routes
       '

  # Implement the required interface for Rails::Generators::Migration.
  # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
  def self.next_migration_number(_path)
    if @prev_migration_nr
      @prev_migration_nr += 1
    else
      @prev_migration_nr = Time.now.utc.strftime('%Y%m%d%H%M%S').to_i
    end
    @prev_migration_nr.to_s
  end

  # Setup the database migrations
  def copy_migrations
    # Can't get this any more DRY, because we need this order.
    %w[user_roles.rb].each do |f|
      better_migration_template f
    end
  end

  # Add behaviors to the user model
  def inject_user_roles_behavior
    file_path = "app/models/#{model_name.underscore}.rb"
    if File.exist?(file_path)
      place_marker = if File.read(file_path).match?(/include Hydra::User/)
                       /include Hydra::User/
                     elsif File.read(file_path).match?(/include Blacklight::User/)
                       /include Blacklight::User/
                     end
      if place_marker
        code = "\n  # Connects this user object to Role-management behaviors.\n" \
               "  include Hydra::RoleManagement::UserRoles\n\n"
        inject_into_file file_path, code, after: place_marker
      else
        Rails.logger.error "     \e[31mFailure\e[0m  Hydra::User is not included in #{file_path}.  Add 'include Hydra::User' and rerun."
      end
    else
      Rails.logger.error "     \e[31mFailure\e[0m  hydra-role-management requires a user object. This generators assumes that the model is defined in the file #{file_path}, which does not exist.  If you used a different name, please re-run the generator and provide that name as an argument. Such as \b  rails -g roles client"
    end
  end

  # The engine routes have to come after the devise routes so that /users/sign_in will work
  def inject_routes
    routing_code = "mount Hydra::RoleManagement::Engine => '/'"
    sentinel = /devise_for :users(.*)$/
    inject_into_file 'config/routes.rb', "\n  #{routing_code}\n", after: sentinel, verbose: false
  end

  # If this gem is installed under Rails 3, an attr_accessible method is required for the Role model.  This
  # file will be added to config/initializers and the correct code will be added to the model at runtime.
  def rails3_attr_accessible
    return if ActionController.const_defined? :StrongParameters

    Rails.logger.info 'Role model will include attr_accessible :name because you are installing this gem in a Rails 3 app.'
    copy_file 'hydra_role_management_rails3.rb', 'config/initializers/hydra_role_management_rails3.rb'
  end

  private

  def better_migration_template(file)
    sleep 1 # ensure scripts have different time stamps
    migration_template "migrations/#{file}", "db/migrate/#{file}"
  rescue StandardError
    Rails.logger.error "  \e[1m\e[34mMigrations\e[0m  " + $ERROR_INFO.message
  end
end
