#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

ENV["RAILS_ROOT"] ||= 'spec/internal'

desc 'Default: run specs.'
task :default => :spec


task :spec => [:clean, :generate] do |t|
  focused_spec = ENV['SPEC'] ? " SPEC=#{File.join(GEM_ROOT, ENV['SPEC'])}" : ''
  within_test_app do
    system "rake myspec#{focused_spec}"
    abort "Error running hydra-role-management" unless $?.success?
  end
end



desc "Create the test rails app"
task :generate do
  unless File.exists?('spec/internal/Rakefile')
    puts "Generating rails app"
    `rails _ENV["RAILS_VERSION"]_ new spec/internal`
    puts "Adding hydra gems to gemfile"
    `cat spec/support/gemfile_stub >> spec/internal/Gemfile`
    puts "Copying generator"
    `cp -r spec/support/lib/generators spec/internal/lib`

    within_test_app do
      `bundle install`
      system "rails generate test_app"
      `rake db:migrate db:test:prepare`
    end
  end
end

desc "Clean out the test rails app"
task :clean do
  puts "Removing sample rails app"
  `rm -rf spec/internal`
end

def within_test_app
  FileUtils.cd('spec/internal')
  Bundler.with_clean_env do
    yield
  end
  FileUtils.cd('../..')
end
