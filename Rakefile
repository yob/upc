require 'rake'
require 'rubygems'
require 'rdoc/task'

$LOAD_PATH.unshift File.dirname(__FILE__) + '/lib'
require 'upc'

begin
  require 'rspec/core/rake_task'

  desc "Run all the specs for the notamock plugin."
  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  puts "no rspec available"
end


desc "Generate documentation for the notamock plugin."
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'UPC'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('MIT-LICENSE')
  rdoc.rdoc_files.include('CHANGELOG')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
