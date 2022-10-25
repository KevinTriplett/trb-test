require "test_helper"

class KevinsTest < Minitest::Spec
  class Create < Trailblazer::Operation
    step :model #,
    #  In() => [:title]

    def model(ctx, title:, **)
      puts title.inspect
      puts ctx[:params].inspect
    end
  end

  # Run without debugging:
  # result = Create.(params: {title: "Suggestion for democracy"})
  result = Create.wtf?(title: "Suggestion for democracy", params: {name: "Joe Kid"})

end
