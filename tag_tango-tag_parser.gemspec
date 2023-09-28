# frozen_string_literal: true

require_relative "lib/tag_tango/tag_parser/version"

Gem::Specification.new do |spec|
  spec.name = "tag_tango-tag_parser"
  spec.version = TagTango::TagParser::VERSION
  spec.authors = ["Alexandr Bulancov"]

  spec.summary = "Tag parser module for TagTango"
  spec.homepage = "https://github.com/trinistr/tag_tango-tag_parser"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/trinistr/tag_tango-tag_parser"
  spec.metadata["changelog_uri"] = "https://github.com/trinistr/tag_tango-tag_parser/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/trinistr/tag_tango-tag_parser/issues"

  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency "ast"
  spec.add_dependency "tag_tango-core"
end
