require "test_helper"

class KevinsTest < Minitest::Spec
  class Create < Trailblazer::Operation
    step :model

    def model(ctx, params:, **)
      raise params.inspect
    end
  end

  # Run without debugging:
  # result = Create.(params: {title: "Suggestion for democracy"})
  result = Create.wtf?(params: {title: "Suggestion for democracy"})

end
