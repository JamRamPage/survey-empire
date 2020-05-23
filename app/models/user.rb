class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :surveys, dependent: :destroy
  validates :consent, presence: true
  validates_confirmation_of :password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
