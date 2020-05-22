require "application_system_test_case"

class QuestionOptionSelectionsTest < ApplicationSystemTestCase
  setup do
    @question_option_selection = question_option_selections(:one)
  end

  test "visiting the index" do
    visit question_option_selections_url
    assert_selector "h1", text: "Question Option Selections"
  end

  test "creating a Question option selection" do
    visit question_option_selections_url
    click_on "New Question Option Selection"

    fill_in "Question answer", with: @question_option_selection.question_answer_id
    fill_in "Question option", with: @question_option_selection.question_option_id
    click_on "Create Question option selection"

    assert_text "Question option selection was successfully created"
    click_on "Back"
  end

  test "updating a Question option selection" do
    visit question_option_selections_url
    click_on "Edit", match: :first

    fill_in "Question answer", with: @question_option_selection.question_answer_id
    fill_in "Question option", with: @question_option_selection.question_option_id
    click_on "Update Question option selection"

    assert_text "Question option selection was successfully updated"
    click_on "Back"
  end

  test "destroying a Question option selection" do
    visit question_option_selections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question option selection was successfully destroyed"
  end
end
