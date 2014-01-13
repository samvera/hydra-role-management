require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../../test_app_templates", __FILE__)
  
  def run_blacklight_generator
    say_status("warning", "GENERATING BL", :yellow)       

    generate 'blacklight', '--devise'
  end

  def run_cancan_generator
    say_status("warning", "GENERATING Ability", :yellow)       
    generate 'cancan:ability'
  end

  def run_roles_generator
    say_status("warning", "GENERATING ROLES", :yellow)       

    generate 'roles', '-f'

  end

  def copy_rspec_rake_task
    copy_file "lib/tasks/rspec.rake"
  end
end
