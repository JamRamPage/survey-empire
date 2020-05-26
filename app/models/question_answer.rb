class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :survey
  has_many :question_option_selections, dependent: :destroy
  accepts_nested_attributes_for :question_option_selections, :allow_destroy => true
  encrypts :givenAnswer, type: :string#, migrating: true
  encrypts :timeStarted, type: :datetime#, migrating: true
  encrypts :timeEnded, type: :datetime#, migrating: true
  encrypts :created_at, type: :datetime#, migrating: true
  encrypts :updated_at, type: :datetime#, migrating: true
  def selectedOption
  end

  def selectedOptions
  end
end
