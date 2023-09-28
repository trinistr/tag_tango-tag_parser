# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in tag_tango-tag_parser.gemspec
gemspec

# gem "tag_tango-core", git: "git@github.com:trinistr/tag_tango-core.git"
gem "tag_tango-core", path: "../tag_tango-core"

group :doc do
  gem "yard"
end

group :human do
  gem "pry", "~> 0.14.2"
end

group :test do
  gem "rake", "~> 13.0"
  gem "rspec", "~> 3.0"
  gem "rubocop", "~> 1.21"
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "simplecov"
  gem "simplecov-lcov"
  gem "undercover"
end
