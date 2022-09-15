# frozen_string_literal: true

module Phlex
  class Compiler
    module Command
      module StandardElementOptimizer
        def format(formatter)
          StandardElement.new(formatter,
            method_name: message.value.to_sym,
            arguments: arguments).call
        end
      end

      module VoidElementOptimizer
        def format(formatter)
          VoidElement.new(formatter,
            method_name: message.value.to_sym,
            arguments: arguments).call
        end
      end
    end
  end
end
