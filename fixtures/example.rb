# frozen_string_literal: true

class Example < Phlex::Component
  def template
    title
    article
    img
    another_method
  end

  def title
    h1
  end
end
