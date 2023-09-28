# frozen_string_literal: true

require "tag_tango/core"
require "zeitwerk"

module TagTango
  # Tag parser module for TagTango.
  module TagParser
    # @api private
    # Zeitwerk loader for this gem.
    # Made +public+ to allow eager_load and reload on demand.
    def self.loader
      return @loader if @loader

      @loader = Zeitwerk::Loader.for_gem_extension(TagTango)
      @loader.inflector.inflect("ast" => "AST")
      @loader.enable_reloading
      @loader
    end

    loader.setup
  end
end
