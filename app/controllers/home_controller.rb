class HomeController < ApplicationController
  include ActionController::Live

  def home
  end

  def contact
  end

  def stream_test
    render stream: true
    10.times {
        response.stream.write "I should get streamed ERB..."
        sleep 0.1
    }
  ensure
    response.stream.close
  end
end
