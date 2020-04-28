# frozen_string_literal: true

require File.expand_path('../lib/hydra/role_management/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Justin Coyne']
  gem.email         = ['jcoyne@justincoyne.com']
  gem.description   = 'Rails engine to do user roles in an RDBMS for hydra-head'
  gem.summary       = 'Rails engine to do user roles in an RDBMS for hydra-head'
  gem.homepage      = 'https://github.com/samvera/hydra-role-management'

  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'hydra-role-management'
  gem.require_paths = ['lib']
  gem.version       = Hydra::RoleManagement::VERSION
  gem.license       = 'Apache 2.0'

  gem.add_dependency 'blacklight'
  gem.add_dependency 'bootstrap_form'
  gem.add_dependency 'bundler', '>= 1.5'
  gem.add_dependency 'cancancan'
  gem.add_dependency 'json', '>= 1.8'
  gem.add_development_dependency 'bixby', '~> 1.0.0'
  gem.add_development_dependency 'engine_cart', '~> 2.1'
  gem.add_development_dependency 'pry-byebug'
  gem.add_development_dependency 'rails-controller-testing', '~> 0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec-its'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'rspec_junit_formatter'
end
