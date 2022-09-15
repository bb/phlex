# frozen_string_literal: true

module Phlex
  class Compiler
    module Visitors
      class ComponentMethod < Base
        def optimized_something?
          !!@optimized_something
        end

        visit_method def visit_vcall(node)
          name = node.value.value.to_sym

          if HTML::STANDARD_ELEMENTS[name] && !@compiler.redefined?(name)
            @optimized_something = true
            node.extend(VCall::StandardElementOptimizer)
          elsif HTML::VOID_ELEMENTS[name] && !@compiler.redefined?(name)
            @optimized_something = true
            node.extend(VCall::VoidElementOptimizer)
          end

          super
        end

        #         visit_method def visit_fcall(node)
        #           name = node.value.value.to_sym
        #
        #           # return super if @compiler.redefined?(name)
        #
        #           if HTML::STANDARD_ELEMENTS[name]
        #             @optimized_something = true
        #             node.extend(FCall::StandardElementOptimizer)
        #           elsif HTML::VOID_ELEMENTS[name]
        #             @optimized_something = true
        #             node.extend(FCall::VoidElementOptimizer)
        #           end
        #
        #           super
        #         end
        #
        #         visit_method def visit_command(node)
        #           name = node.message.value.to_sym
        #
        #           # return super if @compiler.redefined?(name)
        #
        #           if HTML::STANDARD_ELEMENTS[name]
        #             @optimized_something = true
        #             node.extend(Command::StandardElementOptimizer)
        #           elsif HTML::VOID_ELEMENTS[name]
        #             @optimized_something = true
        #             node.extend(Command::VoidElementOptimizer)
        #           end
        #
        #           super
        #         end
      end
    end
  end
end
