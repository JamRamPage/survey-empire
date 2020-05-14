require 'test_helper'

class SurveyAnalysisControllerTest < ActionDispatch::IntegrationTest
  test "should get analyse_survey" do
    get survey_analysis_analyse_survey_url
    assert_response :success
  end

end
