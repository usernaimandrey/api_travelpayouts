# frozen_string_literal: true

class Program < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }

  has_many :banes, class_name: 'Bane', dependent: :destroy
  has_many :subscriptions, class_name: 'Subscription', dependent: :destroy
  has_many :user_subscriptions, through: :subscriptions, source: :user
  has_many :user_banes, through: :banes, source: :user
end
