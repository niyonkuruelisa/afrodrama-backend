# -*- encoding: utf-8 -*-
# stub: streamio-ffmpeg 3.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "streamio-ffmpeg".freeze
  s.version = "3.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rackfish AB".freeze]
  s.date = "2016-11-18"
  s.email = ["support@rackfish.com".freeze, "bikeath1337.com".freeze]
  s.homepage = "http://github.com/streamio/streamio-ffmpeg".freeze
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Wraps ffmpeg to read metadata and transcodes videos.".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1.8"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.1"])
  else
    s.add_dependency(%q<multi_json>.freeze, ["~> 1.8"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
  end
end
