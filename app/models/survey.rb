class Survey < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :question_answers, dependent: :destroy
	has_many :ratings, dependent: :destroy
	accepts_nested_attributes_for :questions, allow_destroy: true
	accepts_nested_attributes_for :ratings
end
