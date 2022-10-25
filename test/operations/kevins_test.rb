require "test_helper"

class KevinsTest < Minitest::Spec
  class Create < Trailblazer::Operation
    step :model,
      In() => [:title]

    def model(ctx, title:, **)
      raise title.inspect
    end
  end

  # Run without debugging:
  # result = Create.(params: {title: "Suggestion for democracy"})
  result = Create.wtf?(title: "Suggestion for democracy", params: {name: "Joe Kid"})

end
