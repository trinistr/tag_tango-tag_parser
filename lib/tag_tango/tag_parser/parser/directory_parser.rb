# frozen_string_literal: true

require "ast"

module TagTango
  module TagParser
    class Parser
      # Parser for a filesystem path consisting of directories.
      #
      # @example
      #   # Last +/+ is required.
      #   directory_parser.call('path/to/my/file/without/file/')
      class DirectoryParser < BaseParser
        AST = ::AST

        def initialize
          super(conjuction_symbol: "/", disjunction_symbol: nil)
        end

        # (see BaseParser#parseable?)
        def parseable?(source)
          regexp.match?(source)
        end

        private

        def parse(source)
          tags = source.split(conjuction_symbol)
          tags.reject!(&:empty?)
          root =
            if tags.empty?
              AST::Node.new(:null)
            elsif tags.one?
              tag = tags.first
              AST::Node.new(:tag, [tags.first], source: tag)
            else
              tag_nodes = tags.map { AST::Node.new(:tag, [_1], source: _1) }
              AST::Node.new(:and, tag_nodes, source:)
            end
          Success(root)
        end

        def regexp
          @regexp ||= %r{\A/?(?>[^/]+/)+\z}
        end
      end
    end
  end
end
