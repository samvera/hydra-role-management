# hydra-role-management

Code:
[![CircleCI](https://circleci.com/gh/samvera/hydra-role-management.svg?style=svg)](https://circleci.com/gh/samvera/hydra-role-management)
[![Gem Version](https://badge.fury.io/rb/hydra-role-management.svg)](https://badge.fury.io/rb/hydra-role-management)
[![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-role-management/badge.svg?branch=master)](https://coveralls.io/github/samvera/hydra-role-management?branch=master)

Docs:
[![Contribution Guidelines](http://img.shields.io/badge/CONTRIBUTING-Guidelines-blue.svg)](./CONTRIBUTING.md)
[![Apache 2.0 License](http://img.shields.io/badge/APACHE2-license-blue.svg)](./LICENSE.md)

Jump In:
[![Slack Status](http://slack.samvera.org/badge.svg)](http://slack.samvera.org/)

# What is hydra-role-management?

An engine gem to provide a RDBMS backed list of roles and their associated user.  This replaces the hydra default role mapper.

As of version 1.0, this gem only supports Rails 5.

## Product Owner & Maintenance

**hydra-role-management** is a Core Component of the Samvera community. The documentation for
what this means can be found
[here](http://samvera.github.io/core_components.html#requirements-for-a-core-component).

### Product Owner

[jrgriffiniii](https://github.com/jrgriffiniii)

# Help

The Samvera community is here to help. Please see our [support guide](./SUPPORT.md).

## Installing:

* Add: ```gem 'hydra-role-management'``` to your Gemfile and then ```bundle install```
* ```rails generate roles```
* ```rake db:migrate```
* Add the following [cancan](https://github.com/ryanb/cancan) abilities:

```
  # app/models/ability.rb
  if current_user.admin?
    can [:create, :show, :add_user, :remove_user, :index, :edit, :update, :destroy], Role
  end
```

## Testing:

* Install a system javascript runtime or uncomment therubyracer in spec/support/Gemfile
* Ensure that the testing app does not exist: ```bundle exec rake clean```
* Set Rails version you want to test against.  For example:
	* ```export RAILS_VERSION=5.1.4```
* Ensure that the correct version of Rails is installed:  ```bundle update```
* Build test app: ```bundle exec rake engine_cart:generate```
* And run tests: ```bundle exec rake spec```

# Acknowledgments

This software has been developed by and is brought to you by the Samvera community.  Learn more at the
[Samvera website](http://samvera.org/).

![Samvera Logo](https://wiki.duraspace.org/download/thumbnails/87459292/samvera-fall-font2-200w.png?version=1&modificationDate=1498550535816&api=v2)
