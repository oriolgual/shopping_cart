# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shopping_cart/version'

Gem::Specification.new do |spec|
  spec.name          = "shopping_cart"
  spec.version       = ShoppingCart::VERSION
  spec.authors       = ["Oriol Gual"]
  spec.email         = ["oriol.gual@gmail.com"]
  spec.summary       = %q{Ironhack exercise}
  spec.description   = %q{Ironhack exercise}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-coolline"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end
