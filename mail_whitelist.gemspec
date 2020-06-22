# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mail_whitelist/version'

Gem::Specification.new do |spec|
  spec.name          = 'mail_whitelist'
  spec.version       = MailWhitelist::VERSION
  spec.authors       = ['Tom Kruijsen']
  spec.email         = ['tom@brightin.nl']

  spec.summary       = 'Easily whitelist email addresses in your Rails app.'
  spec.homepage      = 'https://www.github.com/brightin/mail_whitelist'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
