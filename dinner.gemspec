# frozen_string_literal: true

require_relative "lib/dinner/version"

Gem::Specification.new do |spec|
  spec.name          = "dinner"
  spec.version       = Dinner::VERSION
  spec.authors       = ["Reid"]
  spec.email         = ["rlj0713@gmail.com"]

  spec.summary       = "Find a recipe for dinner tonight."
  spec.description   = "This app is designed to simplify dinner.  Pick from a few protein options and have a shopping list + recipe in seconds."
  spec.homepage      = "https://github.com/rlj0713/dinner"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rlj0713/dinner"
  spec.metadata["changelog_uri"] = "https://github.com/rlj0713/dinner"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add__development_dependency "pry"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
