require 'rubygems' unless ENV['NO_RUBYGEMS']
require 'spec/rake/spectask'
require 'bundler/setup'

task :default => :spec

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  Bundler.require(:test)
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end
