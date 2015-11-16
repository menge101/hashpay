module Timing
  include Anticipate

  def db_execution_delay
    sleeping(0.5).seconds.between_tries.failing_after(10).tries do
      yield
    end
  end

  def ui_response_delay
    sleeping(0.2).seconds.between_tries.failing_after(5).tries do
      yield
    end
  end
end