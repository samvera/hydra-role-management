# -*- encoding : utf-8 -*-
require 'rails/generators'
require 'rails/generators/migration'     

class RolesGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)
  
  argument     :model_name, :type => :string , :default => "user"
  desc """
This generator makes the following changes to your application:
 1. Creates several database migrations if they do not exist in /db/migrate
 2. Adds user behavior to the user model
 2. Adds routes
       """ 

  # Implement the required interface for Rails::Generators::Migration.
  # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
  def self.next_migration_number(path)
    unless @prev_migration_nr
      @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
    else
      @prev_migration_nr += 1
    end
    @prev_migration_nr.to_s
  end

  # Setup the database migrations
  def copy_migrations
    # Can't get this any more DRY, because we need this order.
    %w{user_roles.rb}.each do |f|
      better_migration_template f
    end
  end

  # Add behaviors to the user model
  def inject_user_roles_behavior
    file_path = "app/models/#{model_name.underscore}.rb"
    if File.exists?(file_path) 
      code = "# Connects this user object to Role-management behaviors. " +
        "\n include Hydra::RoleManagement::UserRoles\n"        
      inject_into_file file_path, code, { :after => /include Hydra::User/ }
    else
      puts "     \e[31mFailure\e[0m  hydra-role-management requires a user object. This generators assumes that the model is defined in the file #{file_path}, which does not exist.  If you used a different name, please re-run the generator and provide that name as an argument. Such as \b  rails -g roles client" 
    end    
  end


  # The engine routes have to come after the devise routes so that /users/sign_in will work
  def inject_routes
    routing_code = "mount Hydra::RoleManagement::Engine => '/'"
    sentinel = /devise_for :users/
    inject_into_file 'config/routes.rb', "\n  #{routing_code}\n", { :after => sentinel, :verbose => false }
    
  end

  private  
  
  def better_migration_template (file)
    begin
      migration_template "migrations/#{file}", "db/migrate/#{file}"
      sleep 1 # ensure scripts have different time stamps
    rescue
      puts "  \e[1m\e[34mMigrations\e[0m  " + $!.message
    end
  end

end  


