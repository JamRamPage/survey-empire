class Survey < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :question_answers, dependent: :destroy
end
