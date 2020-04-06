class AddSurveyToQuestionAnswer < ActiveRecord::Migration[5.2]
  def change
    add_reference :question_answers, :survey, foreign_key: true
  end
end
