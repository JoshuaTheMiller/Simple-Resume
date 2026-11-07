# frozen_string_literal: true

source "https://rubygems.org"
gemspec

# The same plugin and Jekyll versions the classic GitHub Pages build uses.
gem "github-pages", group: :jekyll_plugins

# Ruby 3 dropped webrick from the standard library; `jekyll serve` needs it.
gem "webrick"

group :test do
  gem "html-proofer", "~> 5.0"
end
