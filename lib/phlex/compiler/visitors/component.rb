# frozen_string_literal: true

module Phlex
  class Compiler
    module Visitors
      class Component < Base
        visit_method def visit_def(node)
          visitor = Visitors::ComponentMethod.new(@compiler)
          visitor.visit(node)

          if visitor.optimized_something?
            @compiler.redefine(
              format(node)
            )
          end
        end
      end
    end
  end
end
