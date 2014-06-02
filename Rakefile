#!/usr/bin/env rake
require 'bundler/setup'
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
require 'engine_cart/rake_task'


desc 'Default: run ci.'
task :default => :ci


desc "Make clean, generate test app, and run the tests"
task :ci => [:clean, :generate, :spec]

desc "Run the tests"
RSpec::Core::RakeTask.new(:spec)

desc "Create the test rails app"
task :generate => 'engine_cart:generate'

desc "Clean out the test rails app"
task :clean => 'engine_cart:clean'
