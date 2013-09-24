require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../../support", __FILE__)

  # # Inject call to Hydra::BatchEdit.add_routes in config/routes.rb
  # def inject_routes
  #   insert_into_file "config/routes.rb", :after => '.draw do' do
  #     "\n  # Add BatchEdit routes."
  #     "\n  Hydra::BatchEdit.add_routes(self)"
  #   end
  # end


  def run_blacklight_generator
    say_status("warning", "GENERATING BL", :yellow)       

    generate 'blacklight', '--devise'
  end

  def run_hydra_head_generator
    say_status("warning", "GENERATING HH", :yellow)       

    generate 'hydra:head', '-f'
  end

  def run_roles_generator
    say_status("warning", "GENERATING ROLES", :yellow)       

    generate 'roles', '-f'

  end

  # def copy_test_models
  #   copy_file "app/models/sample.rb"
  #   copy_file "app/models/solr_document.rb"
  #   copy_file "db/migrate/20111101221803_create_searches.rb"
  # end

  def copy_rspec_rake_task
    copy_file "lib/tasks/rspec.rake"
  end
end
