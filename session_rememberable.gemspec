require_relative 'lib/session_rememberable/version'

Gem::Specification.new do |spec|
  spec.name          = "session_rememberable"
  spec.version       = SessionRememberable::VERSION
  spec.authors       = ["Michael"]
  spec.email         = ["wynk182@gmail.com"]

  spec.summary       = "Quick concern for session variables"
  spec.homepage      = "https://www.wynk182.com"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'activesupport'
end
