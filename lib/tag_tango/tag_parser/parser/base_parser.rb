# frozen_string_literal: true

module TagTango
  module TagParser
    class Parser
      # Base class for parser implementations.
      class BaseParser
        include Core::Callable
        include Core::Initializable

        option :conjuction_symbol
        option :disjunction_symbol

        # Try to parse +source+.
        #
        # @param source [String] string of tags
        # @return [Success(AST::Node)] parsed AST
        # @return [Failure(Symbol)] if unable to parse +source+
        #   - +:unparseable+ - {#parseable?} returned +false+
        #   - +:not_implemented+ - developer forgot to implement the parser
        def call(source)
          return Failure(:unparseable) unless parseable?(source)

          parse(source)
        end

        # Check if +source+ is parseable by this parser.
        #
        # @return [Boolean]
        def parseable?(_source)
          false
        end

        private

        # Parse source into an AST representation.
        #
        # This is only called after checking {#parseable?}.
        #
        # @param _source [String]
        # @return [Success<AST>]
        # @return [Failure<Symbol>]
        def parse(_source)
          Failure(:not_implemented)
        end

        # Helper method for inserting +conjuction_symbol+ into regexps.
        #
        # @return [String]
        def re_conj
          "(?:#{conjuction_symbol})"
        end

        # Helper method for inserting +disjunction_symbol+ into regexps.
        #
        # @return [String]
        def re_disj
          "(?:#{disjunction_symbol})"
        end
      end
    end
  end
end
