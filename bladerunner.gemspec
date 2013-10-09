$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bladerunner/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bladerunner"
  s.version     = Bladerunner::VERSION
  s.authors     = ["Vincent Roy"]
  s.email       = ["vincentroy8@gmail.com"]
  s.homepage    = "https://github.com/exploid/bladerunner"
  s.summary     = "Edit SQL files in your Rails project with your favourite editor; View results in your browser in realtime as your files are saved."
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "fssm"
end
