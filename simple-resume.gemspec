# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "simple-resume"
  spec.version       = "0.1.0"
  spec.authors       = ["Joshua Miller"]
  spec.email         = [""]

  spec.summary       = "A simple Jekyll theme to show off some technology and experience."
  spec.homepage      = "https://github.com/JoshuaTheMiller/Simple-Resume"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 3.8.6"

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~> 12.0"
end
