class Survey < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :question_answers, dependent: :destroy
	has_many :ratings, dependent: :destroy
	accepts_nested_attributes_for :questions, allow_destroy: true
	accepts_nested_attributes_for :ratings
	validate :end_date_is_after_start_date

	encrypts :public, type: :boolean#, migrating: true
	encrypts :creationDate, type: :datetime#, migrating: true
	encrypts :expiryDate, type: :datetime#, migrating: true
	encrypts :created_at, type: :datetime#, migrating: true
	encrypts :updated_at, type: :datetime#, migrating: true
	encrypts :survey_name, type: :string#, migrating: true

	private

	def end_date_is_after_start_date
	  if expiryDate < creationDate
	    errors.add(:expiryDate, "cannot be before the creation date") 
	  end 
	end
end
