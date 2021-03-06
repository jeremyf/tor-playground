require_relative 'lib/tor/playground/version'

Gem::Specification.new do |spec|
  spec.name          = "tor-playground"
  spec.version       = Tor::Playground::VERSION
  spec.authors       = ["Jeremy Friesen"]
  spec.email         = ["jeremy.n.friesen@gmail.com"]

  spec.summary       = %q{A personal and quasi-professional playground for playing with the semantic web.}
  spec.description   = %q{A personal and quasi-professional playground for playing with the semantic web.}
  spec.homepage      = "https://github.com/jeremyf/tor-playground"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jeremyf/tor-playground"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sparql", "~> 3.1"
  spec.add_dependency "rdf-rdfa", "~> 3.1"
  spec.add_dependency "rdf-turtle", "~> 3.1"
end
