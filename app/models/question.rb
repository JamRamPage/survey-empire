class Question < ApplicationRecord
  belongs_to :survey
  validates :survey_id, presence: true
end
