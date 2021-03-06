# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uinput/version'

Gem::Specification.new do |spec|
  spec.name          = "uinput"
  spec.version       = LinuxInput::Uinput::VERSION
  spec.authors       = ["Christopher Aue"]
  spec.email         = ["mail@christopheraue.net"]

  spec.summary       = %q{Structs and Constants to use uinput with ruby.}
  spec.homepage      = "http://github.com/christopheraue/ruby-uinput"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'linux_input', '~> 1.0'
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "ffi-swig-generator", '~> 0'
end
