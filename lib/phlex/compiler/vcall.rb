# frozen_string_literal: true

module Phlex
  class Compiler
    module VCall
      module StandardElementOptimizer
        def format(formatter)
          StandardElement.new(formatter,
            method_name: value.value.to_sym).call
        end
      end

      module VoidElementOptimizer
        def format(formatter)
          VoidElement.new(formatter,
            method_name: value.value.to_sym).call
        end
      end
    end
  end
end
