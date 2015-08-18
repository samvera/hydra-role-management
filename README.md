An engine gem to provide a RDBMS backed list of roles and their associated user.  This replaces the hydra default role mapper.

This gem supports both Rails 3 and 4.

##Installing:

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

##Testing:
Given the need to support both Rails 3 and 4, the test suite has been parameterized to test against any version of Rails.

* Install a system javascript runtime or uncomment therubyracer in spec/support/Gemfile
* Ensure that the testing app does not exist: ```bundle exec rake clean```
* Set Rails version you want to test against.  For example:
	* ```RAILS_VERSION=3.2.13``` or ```RAILS_VERSION=4.0.0```
* Ensure that the correct version of Rails is installed:  ```bundle update```
* Build test app: ```bundle exec engine_cart:generate```
* And run tests: ```bundle exec rake spec```
