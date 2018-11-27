#!/usr/bin/env rake
# frozen_string_literal: true
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'engine_cart/rake_task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

desc 'Run style checker'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.fail_on_error = true
end

desc 'Run the tests'
task ci: [:rubocop, 'engine_cart:generate'] do
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task['spec'].invoke
end

task default: :ci
