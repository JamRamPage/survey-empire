class Survey < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :question_answers, dependent: :destroy
	has_many :ratings, dependent: :destroy
	accepts_nested_attributes_for :questions, allow_destroy: true
	accepts_nested_attributes_for :ratings


	encrypts :public, type: :boolean#, migrating: true
	encrypts :creationDate, type: :datetime#, migrating: true
	encrypts :expiryDate, type: :datetime#, migrating: true
	encrypts :created_at, type: :datetime#, migrating: true
	encrypts :updated_at, type: :datetime#, migrating: true
	encrypts :survey_name, type: :string#, migrating: true


		#self.ignored_columns=["public", "creationDate", "expiryDate", "created_at", "updated_at", "survey_name"]
end
