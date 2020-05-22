require "application_system_test_case"

class QuestionAnswersTest < ApplicationSystemTestCase
  setup do
    @question_answer = question_answers(:one)
  end

  test "visiting the index" do
    visit question_answers_url
    assert_selector "h1", text: "Question Answers"
  end

  test "creating a Question answer" do
    visit question_answers_url
    click_on "New Question Answer"

    fill_in "Givenanswer", with: @question_answer.givenAnswer
    fill_in "Question", with: @question_answer.question_id
    fill_in "Timeended", with: @question_answer.timeEnded
    fill_in "Timestarted", with: @question_answer.timeStarted
    fill_in "User", with: @question_answer.user_id
    click_on "Create Question answer"

    assert_text "Question answer was successfully created"
    click_on "Back"
  end

  test "updating a Question answer" do
    visit question_answers_url
    click_on "Edit", match: :first

    fill_in "Givenanswer", with: @question_answer.givenAnswer
    fill_in "Question", with: @question_answer.question_id
    fill_in "Timeended", with: @question_answer.timeEnded
    fill_in "Timestarted", with: @question_answer.timeStarted
    fill_in "User", with: @question_answer.user_id
    click_on "Update Question answer"

    assert_text "Question answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Question answer" do
    visit question_answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question answer was successfully destroyed"
  end
end
