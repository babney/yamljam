# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yamljam/version"

Gem::Specification.new do |s|
  s.name        = "yamljam"
  s.version     = Yamljam::VERSION
  s.authors     = ["Bill Abney"]
  s.email       = ["bill.abney@gmail.com"]
  s.homepage    = ""
  s.summary     = "Jam your yaml files"
  s.description = "concatenates multiple yaml files from a subdirectory into one yaml file. Useful for splitting up and re-joining en.yml"

  s.rubyforge_project = "yamljam"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  #s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.executables   = 'yamljam'
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
