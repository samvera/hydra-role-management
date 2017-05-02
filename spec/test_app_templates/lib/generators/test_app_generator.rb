require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root "./spec/test_app_templates"

  def add_gems
    gem 'blacklight', ">= 5.4"
  end

  def run_blacklight_generator
    say_status("warning", "GENERATING BL", :yellow)

    generate 'blacklight:install', '--devise'
  end

  def run_cancan_generator
    say_status("warning", "GENERATING Ability", :yellow)
    generate 'cancan:ability'
  end

  def run_roles_generator
    say_status("warning", "GENERATING ROLES", :yellow)
    generate 'roles', '-f'
  end

  def run_i18n_generator
    say_status("warning", "GENERATING I18N CONFIG", :yellow)
    generate 'i18n'
  end

end
