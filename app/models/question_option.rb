class QuestionOption < ApplicationRecord
  belongs_to :question, optional: true
end
