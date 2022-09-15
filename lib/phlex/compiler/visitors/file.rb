# frozen_string_literal: true

module Phlex
  class Compiler
    module Visitors
      class File < Base
        visit_method def visit_class(node)
          if node.location.start_line == @compiler.line
            Visitors::Component.new(@compiler).visit(node)
          else
            super
          end
        end
      end
    end
  end
end
