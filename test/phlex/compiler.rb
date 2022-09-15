# frozen_string_literal: true

require "test_helper"
require "example"

describe Phlex::Compiler do
  let(:compiler) { Phlex::Compiler.new(Example) }
  let(:optimized_methods) { [] }

  it "doesn't optimize overridden HTML tag methods" do
    mock(compiler) do |mock|
      mock.before(:redefine) { optimized_methods << _1 }
    end

    compiler.call

    expect(optimized_methods).to be == [
      <<~RUBY.chomp,
        def template
          title
          @_target << "<article></article><img />"
          another_method
        end
      RUBY

      <<~RUBY.chomp
        def title
          @_target << "<h1></h1>"
        end
      RUBY
    ]
  end
end
