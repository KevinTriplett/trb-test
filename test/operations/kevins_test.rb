require "test_helper"

class KevinsTest < Minitest::Spec
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :initialize_variable

      def initialize_variable(ctx, title:, **)
        puts title.inspect
        title ||= "no title?"
      end
    end

    step Subprocess(Present)
    step :model,
      In() => [:title],
      Out() => [:name]
    step :show_name

    def model(ctx, title:, **)
      puts title.inspect
      puts ctx[:params].inspect
      ctx[:name] = title
    end

    def show_name(ctx, name:, **)
      puts name.inspect
      puts ctx[:params][:name].inspect
      true
    end
  end

  # Run without debugging:
  # result = Create.(params: {title: "Suggestion for democracy"})
  result = Create.wtf?(title: nil, params: {name: "Joe Kid"})


end
