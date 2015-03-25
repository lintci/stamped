# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stamped/version'

Gem::Specification.new do |spec|
  spec.name          = 'stamped'
  spec.version       = Stamped::VERSION
  spec.authors       = ['Allen Madsen']
  spec.email         = ['blatyo@gmail.com']

  spec.summary       = 'Time extension for dealing with timestamps.'
  spec.description   = 'This gem extends Time with a couple useful methods for dealing with iso8601 encoded times in UTC.'
  spec.homepage      = 'https://github.com/lintci/stamped'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject{|f| f.match(%r{^(test|spec|features)/})}
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}){|f| File.basename(f)}
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'timecop'
end
