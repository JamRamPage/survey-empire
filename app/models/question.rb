class Question < ApplicationRecord
  belongs_to :survey, optional: true
  has_many :question_options, dependent: :destroy
  has_many :question_answers, dependent: :destroy
  #validates :survey_id, presence: true
  accepts_nested_attributes_for :question_options, allow_destroy: true
end
