# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testless_files/version'

Gem::Specification.new do |spec|
  spec.name          = "testless_files"
  spec.version       = TestlessFiles::VERSION
  spec.authors       = ["Pedro Mamede"]
  spec.email         = ["pedro.mamede@gmail.com"]

  spec.summary       = %q{Be aware of files that have no test_spec}
  spec.description   = %q{This gem will look for '.rb' files that are not being tested at all. It uses the rails/rspec naming conventions (spec files missing)}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
