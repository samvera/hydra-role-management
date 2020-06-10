# Changelog

## [1.0.3](https://github.com/samvera/hydra-role-management/tree/1.0.3) (2020-06-10)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v1.0.2...1.0.3)

**Closed issues:**

- Add support for Rails 6.0.z releases [#56](https://github.com/samvera/hydra-role-management/issues/56)
- Add support for Ruby 2.7.z releases [#55](https://github.com/samvera/hydra-role-management/issues/55)

**Merged pull requests:**

- Adding Ruby 2.7.z and Rails 6.y.z to the CircleCI build configuration [#58](https://github.com/samvera/hydra-role-management/pull/58) ([randalldfloyd](https://github.com/randalldfloyd))

## [v1.0.2](https://github.com/samvera/hydra-role-management/tree/v1.0.2) (2019-09-24)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v1.0.1...v1.0.2)

**Implemented enhancements:**

- Generate a changelog [#49](https://github.com/samvera/hydra-role-management/issues/49)

**Closed issues:**

- Json 1.8 dependency is incompatible with bundler 2.x [#53](https://github.com/samvera/hydra-role-management/issues/53)

**Merged pull requests:**

- Prep for 1.0.2 release [#54](https://github.com/samvera/hydra-role-management/pull/54) ([bess](https://github.com/bess))
- Allow for later json versions [#52](https://github.com/samvera/hydra-role-management/pull/52) ([bess](https://github.com/bess))

## [v1.0.1](https://github.com/samvera/hydra-role-management/tree/v1.0.1) (2019-09-13)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v1.0.0...v1.0.1)

**Implemented enhancements:**

- Migrate from Waffle.io to GitHub Projects [#46](https://github.com/samvera/hydra-role-management/issues/46)

**Closed issues:**

- Test against Rails release 5.1.7 and Ruby releases 2.6.3, 2.5.5, and 2.4.6 [#47](https://github.com/samvera/hydra-role-management/issues/47)
- Use CircleCI for continuous integration [#44](https://github.com/samvera/hydra-role-management/issues/44)
- Link to the contributing guidelines in the README [#39](https://github.com/samvera/hydra-role-management/issues/39)
- Test using Ruby releases 2.5.1 and 2.4.4 (also, test using Rails 5.2.0, 5.1.6, and 5.0.7) [#38](https://github.com/samvera/hydra-role-management/issues/38)
- Replace "Hydra" with "Samvera" in CONTRIBUTING.md [#37](https://github.com/samvera/hydra-role-management/issues/37)
- Improve test coverage to 100% [#36](https://github.com/samvera/hydra-role-management/issues/36)
- Integrate RuboCop for enforcing styling guidelines [#34](https://github.com/samvera/hydra-role-management/issues/34)
- Email as User id [#21](https://github.com/samvera/hydra-role-management/issues/21)
- roles generator messes up routes file [#9](https://github.com/samvera/hydra-role-management/issues/9)

**Merged pull requests:**

- Releases version 1.0.1 [#51](https://github.com/samvera/hydra-role-management/pull/51) ([jrgriffiniii](https://github.com/jrgriffiniii))
- Update CircleCI Ruby and Rails versions [#50](https://github.com/samvera/hydra-role-management/pull/50) ([botimer](https://github.com/botimer))
- Updates the CircleCI configuration to test against Rails release 5.1.7 and Ruby releases 2.6.3, 2.5.5, and 2.4.6 [#48](https://github.com/samvera/hydra-role-management/pull/48) ([jrgriffiniii](https://github.com/jrgriffiniii))
- Integrates CircleCI for continuous integration [#45](https://github.com/samvera/hydra-role-management/pull/45) ([jrgriffiniii](https://github.com/jrgriffiniii))
- Updating the dependencies to support bundler 2.0.x releases and to require engine_cart 2.1.x releases [#43](https://github.com/samvera/hydra-role-management/pull/43) ([jrgriffiniii](https://github.com/jrgriffiniii))
- Updating the Travis CI build matrix to use Ruby 2.5.1 and 2.4.4 along with Rails 5.2.1, 5.1.6, and 5.0.7 [#41](https://github.com/samvera/hydra-role-management/pull/41) ([jrgriffiniii](https://github.com/jrgriffiniii))
- Update docs according to templates [#40](https://github.com/samvera/hydra-role-management/pull/40) ([botimer](https://github.com/botimer))
- Integrating Bixby and RuboCop [#35](https://github.com/samvera/hydra-role-management/pull/35) ([jrgriffiniii](https://github.com/jrgriffiniii))
- Ensures that more complex Devise routes are not broken by the insertion of mount Hydra::RoleManagement::Engine => '/' [#33](https://github.com/samvera/hydra-role-management/pull/33) ([jrgriffiniii](https://github.com/jrgriffiniii))
- Use user.id instead of user in the path for the "Remove User" delete ... [#32](https://github.com/samvera/hydra-role-management/pull/32) ([coblej](https://github.com/coblej))

## [v1.0.0](https://github.com/samvera/hydra-role-management/tree/v1.0.0) (2017-11-02)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v1.0...v1.0.0)

## [v1.0](https://github.com/samvera/hydra-role-management/tree/v1.0) (2017-11-02)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v0.2.2...v1.0)

**Closed issues:**

- This gem is incompatible with Rails 5.1.2 migrations [#27](https://github.com/samvera/hydra-role-management/issues/27)

**Merged pull requests:**

- Tagging version 1.0 [#31](https://github.com/samvera/hydra-role-management/pull/31) ([bess](https://github.com/bess))
- Update build matrix and README [#30](https://github.com/samvera/hydra-role-management/pull/30) ([bess](https://github.com/bess))
- Add coveralls and travis badges [#29](https://github.com/samvera/hydra-role-management/pull/29) ([bess](https://github.com/bess))
- version user_roles migration template [#28](https://github.com/samvera/hydra-role-management/pull/28) ([dunn](https://github.com/dunn))
- Remove i18n-tasks for testing [#26](https://github.com/samvera/hydra-role-management/pull/26) ([elrayle](https://github.com/elrayle))
- Use translations for labels [#24](https://github.com/samvera/hydra-role-management/pull/24) ([elrayle](https://github.com/elrayle))
- Update engine_cart to 1.x [#23](https://github.com/samvera/hydra-role-management/pull/23) ([mjgiarlo](https://github.com/mjgiarlo))
- Stop spamming IRC with Travis builds [#22](https://github.com/samvera/hydra-role-management/pull/22) ([mjgiarlo](https://github.com/mjgiarlo))

## [v0.2.2](https://github.com/samvera/hydra-role-management/tree/v0.2.2) (2015-08-14)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v0.2.1...v0.2.2)

**Closed issues:**

- License missing from gemspec [#7](https://github.com/samvera/hydra-role-management/issues/7)

**Merged pull requests:**

- Remove outdated cancan fix. [#20](https://github.com/samvera/hydra-role-management/pull/20) ([rotated8](https://github.com/rotated8))
- Fix indenting on the lines generated into the User class [#19](https://github.com/samvera/hydra-role-management/pull/19) ([jcoyne](https://github.com/jcoyne))
- Added Apache 2.0 License. Fixes #7 [#18](https://github.com/samvera/hydra-role-management/pull/18) ([jcoyne](https://github.com/jcoyne))

## [v0.2.1](https://github.com/samvera/hydra-role-management/tree/v0.2.1) (2014-12-18)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v0.2.0...v0.2.1)

**Merged pull requests:**

- bumps version to '0.2.1' [#17](https://github.com/samvera/hydra-role-management/pull/17) ([mkorcy](https://github.com/mkorcy))
- Upgrade issues [#16](https://github.com/samvera/hydra-role-management/pull/16) ([mkorcy](https://github.com/mkorcy))

## [v0.2.0](https://github.com/samvera/hydra-role-management/tree/v0.2.0) (2014-06-25)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v0.1.0...v0.2.0)

**Closed issues:**

- Decouple from hydra-head [#12](https://github.com/samvera/hydra-role-management/issues/12)
- don't depend on devise-guests [#10](https://github.com/samvera/hydra-role-management/issues/10)

**Merged pull requests:**

- Upgrade to boostrap_form (instead of bootstrap_forms) [#14](https://github.com/samvera/hydra-role-management/pull/14) ([val99erie](https://github.com/val99erie))
- Remove dependency on hydra-head. Fixes #12 [#13](https://github.com/samvera/hydra-role-management/pull/13) ([jcoyne](https://github.com/jcoyne))
- Don't check guest? unless DeviseGuests is installed. [#11](https://github.com/samvera/hydra-role-management/pull/11) ([jcoyne](https://github.com/jcoyne))
- Support drawing routes on a path other than /roles [#8](https://github.com/samvera/hydra-role-management/pull/8) ([mbklein](https://github.com/mbklein))

## [v0.1.0](https://github.com/samvera/hydra-role-management/tree/v0.1.0) (2013-09-24)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v0.0.2...v0.1.0)

**Implemented enhancements:**

- Add documentation about needed cancan abilities [#2](https://github.com/samvera/hydra-role-management/issues/2)

**Merged pull requests:**

- Rails4 support [#6](https://github.com/samvera/hydra-role-management/pull/6) ([acurley](https://github.com/acurley))
- Redirect to edit when user can't edit all roles but can edit the current role [#5](https://github.com/samvera/hydra-role-management/pull/5) ([cjcolvar](https://github.com/cjcolvar))
- Allow renaming roles and deleting roles [#4](https://github.com/samvera/hydra-role-management/pull/4) ([cjcolvar](https://github.com/cjcolvar))
- Testing notes in README; newline before User model injection; require bootstrap_forms [#1](https://github.com/samvera/hydra-role-management/pull/1) ([cjcolvar](https://github.com/cjcolvar))

## [v0.0.2](https://github.com/samvera/hydra-role-management/tree/v0.0.2) (2013-04-18)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/v0.0.1...v0.0.2)

## [v0.0.1](https://github.com/samvera/hydra-role-management/tree/v0.0.1) (2013-04-18)

[Full Changelog](https://github.com/samvera/hydra-role-management/compare/0ab8d8ace4200cc7058e0cf1de77db6bb531ddf6...v0.0.1)

* _This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)_
