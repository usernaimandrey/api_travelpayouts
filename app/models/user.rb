class User < ApplicationRecord
  before_save { email == email.downcase }

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :name, length: { minimum: 2 }

  has_many :subscriptions, dependent: :destroy
  has_many :programs, through: :subscriptions

  has_secure_password
end
