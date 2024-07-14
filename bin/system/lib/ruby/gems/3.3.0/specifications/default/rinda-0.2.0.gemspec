# -*- encoding: utf-8 -*-
# stub: rinda 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rinda".freeze
  s.version = "0.2.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/ruby/rinda", "source_code_uri" => "https://github.com/ruby/rinda" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Masatoshi SEKI".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-06-12"
  s.description = "The Linda distributed computing paradigm in Ruby.".freeze
  s.email = ["seki@ruby-lang.org".freeze]
  s.files = ["rinda/rinda.rb".freeze, "rinda/ring.rb".freeze, "rinda/tuplespace.rb".freeze]
  s.homepage = "https://github.com/ruby/rinda".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.5.11".freeze
  s.summary = "The Linda distributed computing paradigm in Ruby.".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<drb>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<ipaddr>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<forwardable>.freeze, [">= 0".freeze])
end
