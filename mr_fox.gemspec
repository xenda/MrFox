# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mr_fox/version"

Gem::Specification.new do |s|
  s.name        = "MrFox"
  s.version     = MrFox::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alvaro Pereyra","Gustavo Leon"]
  s.email       = ["alvaro@xendacentral.com","gustavo@xendacentral.com"]
  s.homepage    = ""
  s.summary     = %q{MrFox eases the analytics tracing of web apps}
  s.description = %q{MrFox sends data through REST queries to the MrFoxServer}

  s.rubyforge_project = "mr_fox"
  s.add_dependency "sinatra"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
