require "test_helper"

class KevinsTest < Minitest::Spec
  class Create < Trailblazer::Operation
    step :model,
      In() => [:title]
      Out() => [:name]
    step :show_name

    def model(ctx, title:, **)
      puts title.inspect
      puts ctx[:params].inspect
      ctx[:name] = title
    end

    def show_name(ctx, **)
      puts ctx[:name]
      true
    end
  end

  # Run without debugging:
  # result = Create.(params: {title: "Suggestion for democracy"})
  result = Create.wtf?(title: "Suggestion for democracy", params: {name: "Joe Kid"})


end
