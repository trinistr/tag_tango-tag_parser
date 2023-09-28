# frozen_string_literal: true

module TagTango
  module TagParser
    # Public interface for parsing tags.
    class Parser
      include Core::Callable

      # Parse a string of tags into an AST.
      #
      # @param source [String]
      # @return [Success(AST::Node)]
      # @return [Failure(Symbol)]
      #   - +:unparseable+ - if no parser can process the +source+
      def call(source)
        DirectoryParser.new.call(source)
      end
    end
  end
end
