class QuestionOptionSelection < ApplicationRecord
  belongs_to :question_answer
  belongs_to :question_option

  encrypts :created_at, type: :datetime#, migrating: true
  encrypts :updated_at, type: :datetime#, migrating: true
  def text
    QuestionOption.find_by(id: self.question_option_id).optionString
  end
  def correct
    QuestionOption.find_by(id: self.question_option_id).correct
  end
end
