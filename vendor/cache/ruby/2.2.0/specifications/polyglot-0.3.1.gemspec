# -*- encoding: utf-8 -*-
# stub: polyglot 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "polyglot"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Clifford Heath"]
  s.date = "2010-03-28"
  s.description = "Allows custom language loaders for specified file extensions to be hooked into require"
  s.email = "cjheath@rubyforge.org"
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.homepage = "http://polyglot.rubyforge.org"
  s.rdoc_options = ["--main", "README.txt"]
  s.rubyforge_project = "polyglot"
  s.rubygems_version = "2.4.5"
  s.summary = "Allows custom language loaders for specified file extensions to be hooked into require"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end
