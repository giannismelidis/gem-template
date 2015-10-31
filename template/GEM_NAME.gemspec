# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'GEM_NAME/version'

Gem::Specification.new do |gem|
  gem.name          = 'GEM_NAME'
  gem.version       = GEM_NAMESPACE::VERSION
  gem.authors       = ['giannismelidis']
  gem.email         = ['FIXME: Change email']
  gem.description   = %q{FIXME: Change description}
  gem.summary       = %q{FIXME: Change summary}
  gem.homepage      = 'http://github.com/giannismelidis/GEM_NAME'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'pry'
end
