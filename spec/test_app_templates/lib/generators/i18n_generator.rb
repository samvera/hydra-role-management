# -*- encoding : utf-8 -*-

require 'rails/generators'

class I18nGenerator < Rails::Generators::Base
  desc """
    This generator installs the i18n configuration file into the engine_cart test application.
       """

  source_root File.expand_path('../templates', __FILE__)

  def i18n_config
    copy_file 'i18n-tasks.yml', 'config/i18n-tasks.yml'
  end
end
