  class HomeController < ApplicationController
  include ActionController::Live

  def home
  end

  def contact
  end

  def stream_test
  #   response.headers['Content-Type'] = 'text/event-stream'
  #   sse = SSE.new response.stream , retry: 3000, event: "home_stream"
  #   sse.write({total_surveys: Survey.count})
  # ensure
  #   response.stream.close
  end
end
