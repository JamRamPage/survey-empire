class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :question_option_selections, dependent: :destroy
end
