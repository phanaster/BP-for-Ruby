# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bpruby/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Phantastisch"]
  gem.email         = ["gekuesst@googlemail.com"]
  gem.description   = %q{Bitpay for Ruby}
  gem.summary       = %q{Easy Bitpay-Api Calls for Ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bpruby"
  gem.require_paths = ["lib"]
  gem.version       = Bpruby::VERSION
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_dependency "rest-client"
end
