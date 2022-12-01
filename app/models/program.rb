class Program < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
end
