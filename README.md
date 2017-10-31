# hydra-role-management

[![Build Status](https://travis-ci.org/samvera/hydra-role-management.svg?branch=master)](https://travis-ci.org/samvera/hydra-role-management) [![Gem Version](https://badge.fury.io/rb/hydra-role-management.svg)](https://badge.fury.io/rb/hydra-role-management) [![Coverage Status](https://coveralls.io/repos/github/samvera/hydra-role-management/badge.svg?branch=master)](https://coveralls.io/github/samvera/hydra-role-management?branch=master)


An engine gem to provide a RDBMS backed list of roles and their associated user.  This replaces the hydra default role mapper.

This gem supports Rails 3, 4, and 5.

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
Given the need to support Rails 3, 4 and 5, the test suite has been parameterized to test against any version of Rails.

* Install a system javascript runtime or uncomment therubyracer in spec/support/Gemfile
* Ensure that the testing app does not exist: ```bundle exec rake clean```
* Set Rails version you want to test against.  For example:
	* ```RAILS_VERSION=3.2.13``` or ```RAILS_VERSION=4.0.0``` or ```RAILS_VERSION=5.0.2```
* Ensure that the correct version of Rails is installed:  ```bundle update```
* Build test app: ```bundle exec engine_cart:generate```
* And run tests: ```bundle exec rake spec```
