#! /usr/bin/env ruby

require 'rake/clean'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test"
  t.ruby_opts << "-rtest/unit"
  t.test_files = FileList["test/test*.rb"]
  t.verbose = true
  t.warning = true
end

task :default => :test

desc "The path to enlightenment."
task :koans do
  Dir.chdir "koans" do
    system "rake"
  end
end
