class QuestionOption < ApplicationRecord
  belongs_to :question, optional: true
  has_many :question_option_selections, dependent: :destroy
end
