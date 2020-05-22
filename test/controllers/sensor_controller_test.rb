require 'test_helper'

class SensorControllerTest < ActionDispatch::IntegrationTest
  test "should get temperature" do
    get sensor_temperature_url
    assert_response :success
  end

end
