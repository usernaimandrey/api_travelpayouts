# frozen_string_literal: true

class Api::V1::Account::SubscriptionPolicy < ApplicationPolicy
  def destroy?
    author?
  end
end
