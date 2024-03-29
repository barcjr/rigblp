# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rigblp/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Hargobind S. Khalsa"]
  gem.email         = ["khalsah@gmail.com"]
  gem.summary       = %q{$BARC Jr. Logging Program rig control}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rigblp"
  gem.require_paths = ["lib"]
  gem.version       = Rigblp::VERSION

  gem.add_runtime_dependency "thor", "~> 0.14.0"
  gem.add_runtime_dependency "rest-client"
end
