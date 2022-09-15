# frozen_string_literal: true

module Phlex
  class Compiler
    class StandardElement
      def initialize(formatter, method_name:, arguments: nil)
        @formatter = formatter
        @method_name = method_name
        @arguments = arguments
      end

      def call
        @formatter.append do |f|
          f.text "<"
          f.breakable
          f.text tag
          f.breakable
          f.text ">"

          f.breakable

          f.text "</"
          f.text tag
          f.text ">"
        end
      end

      private

      def content_argument
        @arguments&.parts&.first
      end

      def tag
        HTML::STANDARD_ELEMENTS[@method_name]
      end
    end
  end
end
