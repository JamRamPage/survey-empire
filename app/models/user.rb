class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  #validates :consent, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  encrypts :email, type: :string#, migrating: true
  encrypts :reset_password_token, type: :string#, migrating: true
  encrypts :reset_password_sent_at, type: :datetime#, migrating: true
  encrypts :remember_created_at, type: :datetime#, migrating: true
  encrypts :created_at, type: :datetime#, migrating: true
  encrypts :updated_at, type: :datetime#, migrating: true
  encrypts :consent, type: :boolean#, migrating: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
