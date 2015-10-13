# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avangate/version'

Gem::Specification.new do |spec|
  spec.name          = "avangate"
  spec.version       = Avangate::VERSION
  spec.authors       = ["Leo"]
  spec.email         = ["leo.majowka@gmail.com"]

  spec.summary       = "Avangate integration for Ruby on Rails using their SOAP API with Savon"
  spec.description   = "Avangate integration for Ruby on Rails using their SOAP API with Savon"
  spec.homepage      = "https://github.com/lmajowka/avangate"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
