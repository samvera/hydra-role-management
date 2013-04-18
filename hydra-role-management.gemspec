# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hydra/role_management/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Justin Coyne"]
  gem.email         = ["justin@curationexperts.com"]
  gem.description   = %q{Rails engine to do user roles in an RDBMS for hydra-head}
  gem.summary       = %q{Rails engine to do user roles in an RDBMS for hydra-head}
  gem.homepage      = "https://github.com/projecthydra/hydra-role-managment"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hydra-role-management"
  gem.require_paths = ["lib"]
  gem.version       = Hydra::RoleManagement::VERSION

  gem.add_dependency 'cancan'
  gem.add_dependency 'bootstrap_forms'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rails'
  gem.add_development_dependency 'rspec-rails'
end
