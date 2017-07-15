require 'rake'
require 'rubygems'
require 'rdoc/task'
require 'rubygems/package_task'

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

PKG_NAME           = "upc"
PKG_VERSION        = UPC::Version::String
PKG_FILE_NAME      = "#{PKG_NAME}-#{PKG_VERSION}"
RUBY_FORGE_PROJECT = "yob-projects"

spec = Gem::Specification.new do |s|
  s.name              = PKG_NAME
  s.version           = PKG_VERSION
  s.summary           = "a (very) small library for working with Universal Product Codes"
  s.description       = "a (very) small library for working with Universal Product Codes"
  s.author            = "James Healy"
  s.email             = "jimmy@deefa.com"
  s.homepage          = "http://github.com/yob/upc/tree/master"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "UPC" <<
                        "--line-numbers"
  s.rubyforge_project = RUBY_FORGE_PROJECT
  s.test_files        = FileList["spec/**/*_spec.rb"]
  s.files             = FileList[
    "lib/**/*.rb",
    "MIT-LICENSE",
    "README.rdoc",
    "CHANGELOG"
  ]
end

Rake::PackageTask.new(spec) do |p|
  p.version = PKG_VERSION
  p.need_tar = false
  p.need_zip = false
end
