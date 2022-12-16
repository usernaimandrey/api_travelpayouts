# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize

  enumerize :role, in: %i[user admin], default: :user, predicates: true

  has_many :banes, class_name: 'Bane', dependent: :destroy
  has_many :subscriptions, class_name: 'Subscription', dependent: :destroy
  has_many :program_banes, through: :banes, source: :program
  has_many :program_subscriptions, through: :subscriptions, source: :program

  has_secure_password

  def valid_password?(password)
    authenticate(password)
  end
end
