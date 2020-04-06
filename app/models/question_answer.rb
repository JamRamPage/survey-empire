class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :survey
  has_many :question_option_selections, dependent: :destroy
end
