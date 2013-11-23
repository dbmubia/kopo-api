# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kopo/version'

Gem::Specification.new do |spec|
  spec.name          = "kopo"
  spec.version       = Kopo::VERSION
  spec.authors       = ["JP"]
  spec.email         = ["bonnerjp@gmail.com"]
  spec.description   = ["A Ruby API wrapper for Kopo Kopo's M-PESA payment system."]
  spec.summary       = [""]
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.12.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
