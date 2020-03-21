require 'test_helper'

class QuestionOptionSelectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_option_selection = question_option_selections(:one)
  end

  test "should get index" do
    get question_option_selections_url
    assert_response :success
  end

  test "should get new" do
    get new_question_option_selection_url
    assert_response :success
  end

  test "should create question_option_selection" do
    assert_difference('QuestionOptionSelection.count') do
      post question_option_selections_url, params: { question_option_selection: { question_answer_id: @question_option_selection.question_answer_id, question_option_id: @question_option_selection.question_option_id } }
    end

    assert_redirected_to question_option_selection_url(QuestionOptionSelection.last)
  end

  test "should show question_option_selection" do
    get question_option_selection_url(@question_option_selection)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_option_selection_url(@question_option_selection)
    assert_response :success
  end

  test "should update question_option_selection" do
    patch question_option_selection_url(@question_option_selection), params: { question_option_selection: { question_answer_id: @question_option_selection.question_answer_id, question_option_id: @question_option_selection.question_option_id } }
    assert_redirected_to question_option_selection_url(@question_option_selection)
  end

  test "should destroy question_option_selection" do
    assert_difference('QuestionOptionSelection.count', -1) do
      delete question_option_selection_url(@question_option_selection)
    end

    assert_redirected_to question_option_selections_url
  end
end
