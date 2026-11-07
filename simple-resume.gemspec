# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "simple-resume"
  spec.version       = "1.0.0"
  spec.authors       = ["Joshua Miller"]

  spec.summary       = "A simple Jekyll theme to show off some technology and experience."
  spec.description   = "A single-page resume theme for Jekyll, driven entirely by data files."
  spec.homepage      = "https://github.com/JoshuaTheMiller/Simple-Resume"
  spec.license       = "MIT"

  spec.metadata = {
    "source_code_uri"   => "https://github.com/JoshuaTheMiller/Simple-Resume",
    "changelog_uri"     => "https://github.com/JoshuaTheMiller/Simple-Resume/blob/master/CHANGELOG.md",
    "bug_tracker_uri"   => "https://github.com/JoshuaTheMiller/Simple-Resume/issues",
    "homepage_uri"      => "https://joshuamiller.net",
  }

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|CHANGELOG)!i) }

  # Jekyll 4.3+ compiles Sass with Dart Sass (sass-embedded), which the @use syntax needs.
  # The classic GitHub Pages build runs Jekyll 3; build with GitHub Actions instead.
  spec.add_runtime_dependency "jekyll", ">= 4.3", "< 5"
end
