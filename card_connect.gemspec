
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "card_connect/version"

Gem::Specification.new do |spec|
  spec.name          = "card_connect"
  spec.version       = CardConnect::VERSION
  spec.authors       = ["PlayByCourt Team"]
  spec.email         = ["dev@playbycourt.com"]

  spec.summary       = "A wrapper for CardConnect APIs"
  spec.description   = "A wrapper to make easier the integration with CardConnect APIs, initially based on mobilecause/cardconnect, but with planned support for all endpoints"
  spec.homepage      = "https://github.com/PlaybyCourt"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'pry'

  spec.add_dependency 'faraday', '1.10.0'
  spec.add_dependency 'faraday_middleware', '1.2.0'
end
