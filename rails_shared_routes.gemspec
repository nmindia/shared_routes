# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_shared_routes/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_shared_routes"
  spec.version       = RailsSharedRoutes::VERSION
  spec.authors       = ["Systango"]
  spec.email         = ["mayank@systango.com"]
  spec.description   = %q{ Helper to share routes across different rails applications.}
  spec.summary       = %q{ Helper to share routes across different rails applications. }
  spec.homepage      = "http://www.systango.com"
  
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "semantic_logger", "~> 2.7.0"
  spec.add_dependency "settingslogic", '~>2.0.10'

  spec.add_dependency "rails", "~> 4.0.1"
  spec.add_dependency "railties", "~> 4.0.1"
  spec.add_dependency "activerecord", "~> 4.0.1"
  spec.add_dependency "activesupport", "~> 4.0.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  
end
