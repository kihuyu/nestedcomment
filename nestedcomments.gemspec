$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nestedcomments/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nestedcomments"
  s.version     = Nestedcomments::VERSION
  s.authors     = ["Maina"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = "Summary of Nestedcomments."
  s.description = "Description of Nestedcomments."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.5"

  s.add_development_dependency "sqlite3"
end
