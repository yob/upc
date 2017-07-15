Gem::Specification.new do |spec|
  spec.name = "upc"
  spec.version = "1.1.0"
  spec.summary = "a (very) small library for working with Universal Product Codes"
  spec.description = "a (very) small library for working with Universal Product Codes"
  spec.license = "MIT"
  spec.author = "James Healy"
  spec.email = "jimmy@deefa.com"
  spec.homepage = "http://github.com/yob/upc"
  spec.has_rdoc = true
  spec.rdoc_options << "--title" << "UPC" << "--line-numbers"

  spec.required_ruby_version = ">=1.9.3"

  spec.test_files = Dir.glob("spec/**/*_spec.rb")
  spec.files = Dir.glob("lib/**/*.rb") + ["MIT-LICENSE", "README.markdown", "CHANGELOG" ]

  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec", "~> 3.0")
end
