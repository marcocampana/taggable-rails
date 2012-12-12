# -*- encoding: utf-8 -*-
require File.expand_path('../lib/taggable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marco Campana"]
  gem.email         = ["m.campana@gmail.com"]
  gem.description   = %q{ActiveRecord tagging library}
  gem.homepage      = "http://xterm.it"

  #gem.files         = Dir.glob("{bin,lib,vendor}/**/*") + %w(LICENSE README.md)
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "taggable-rails"
  gem.require_paths = ["lib"]
  gem.version       = Taggable::VERSION

  # Dependencies
  gem.add_dependency "activesupport"
  gem.add_dependency "activemodel"
end
