# hydra-role-management

[![Build Status](https://travis-ci.org/samvera/hydra-role-management.svg?branch=master)](https://travis-ci.org/samvera/hydra-role-management) [![Gem Version](https://badge.fury.io/rb/hydra-role-management.svg)](https://badge.fury.io/rb/hydra-role-management) [![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-role-management/badge.svg?branch=master)](https://coveralls.io/github/samvera/hydra-role-management?branch=master)


An engine gem to provide a RDBMS backed list of roles and their associated user.  This replaces the hydra default role mapper.

As of version 1.0, this gem only supports Rails 5.

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
