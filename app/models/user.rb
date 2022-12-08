# frozen_string_literal: true

class User < ApplicationRecord
  before_save { email == email.downcase }

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :name, length: { minimum: 2 }

  has_many :banes, class_name: 'Bane', dependent: :destroy
  has_many :subscriptions, class_name: 'Subscription', dependent: :destroy
  has_many :program_banes, through: :banes, source: :program
  has_many :program_subscriptions, through: :subscriptions, source: :program

  has_secure_password
end
