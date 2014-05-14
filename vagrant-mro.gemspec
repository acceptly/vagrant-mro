# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-mro/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-mro"
  spec.version       = VagrantPlugins::MRO::VERSION
  spec.authors       = ["Sam Halicke"]
  spec.email         = ["sam@twenty20.com"]
  spec.summary       = %q{Produces machine-readable global status output.}
  spec.description   = %q{Produces machine-readable global status output.}
  spec.homepage      = "https://github.com/acceptly/vagrant-mro"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
