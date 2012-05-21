$:.push File.expand_path("../lib", __FILE__)
require "geo_ip_json/version"

Gem::Specification.new do |s|
  s.name        = "geo-ip-json"
  s.version     = GeoIPJson::VERSION
  s.authors     = ["Jordan Elver"]
  s.email       = ["jordan.elver@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Geo IP information via JSON rack app}
  s.description = %q{Geo IP information via JSON rack app}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "geoip"
end
