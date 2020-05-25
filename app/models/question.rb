class Question < ApplicationRecord
  belongs_to :survey, optional: true
  has_many :question_options, dependent: :destroy
  has_many :question_answers, dependent: :destroy
  #validates :survey_id, presence: true
  accepts_nested_attributes_for :question_options, allow_destroy: true

  encrypts :questionString, type: :string#, migrating: true
  encrypts :multipleChoice, type: :boolean#, migrating: true
  encrypts :multipleAnswer, type: :boolean#, migrating: true
  encrypts :created_at, type: :datetime#, migrating: true
  encrypts :updated_at, type: :datetime#, migrating: true

end
