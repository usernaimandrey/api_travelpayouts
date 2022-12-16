# frozen_string_literal: true

class Api::V1::SignUpForm < User
  include ActiveFormModel

  fields :name, :email, :password, :password_confirmation

  validates :email, presence: true
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, length: { minimum: 2 }
  validate :user_exist

  def email=(email)
    if email.present?
      write_attribute(:email, email.downcase)
    else
      super
    end
  end

  def user_exist
    @user ||= User.find_by(email: email)
    raise UserExistError unless @user.nil?
  end
end
