# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tick_tick/version'

Gem::Specification.new do |spec|
  spec.name          = 'tick_tick'
  spec.version       = TickTick::VERSION
  spec.authors       = ['Max Hollmann']
  spec.email         = ['maxhollmann@gmail.com']

  spec.summary       = 'TickTick API client'
  spec.description   = 'Client for the unofficial TickTick API.'
  spec.homepage      = 'https://github.com/maxhollmann/ruby-tick_tick'

  spec.files         = Dir['lib/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-struct'
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'httparty'

  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov', '~> 0.17.0'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
