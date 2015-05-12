# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uinput/version'

Gem::Specification.new do |spec|
  spec.name          = "uinput"
  spec.version       = UInput::VERSION
  spec.authors       = ["Christopher Aue"]
  spec.email         = ["mail@christopheraue.net"]

  spec.summary       = %q{uinput ruby interface using ffi}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "http://github.com/christopheraue/ruby-uinput"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'ffi', '~> 1.9'
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "ffi-swig-generator"
end
