class QuestionOption < ApplicationRecord
  belongs_to :question, optional: true

  encrypts :optionString, type: :string#, migrating: true
  encrypts :correct, type: :boolean#, migrating: true
  encrypts :created_at, type: :datetime#, migrating: true
  encrypts :updated_at, type: :datetime#, migrating: true
end
