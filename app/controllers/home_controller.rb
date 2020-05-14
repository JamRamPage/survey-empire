  class HomeController < ApplicationController
  include ActionController::Live

  def home
  end

  def contact
  end

  def stream_test
  #   response.headers['Content-Type'] = 'text/event-stream'
  #   sse = SSE.new response.stream , retry: 3000, event: "stream_test"
  #   sse.write({ value: 100 * rand})
  # ensure
  #   response.stream.close
  end
end
