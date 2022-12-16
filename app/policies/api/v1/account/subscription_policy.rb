
class Api::V1::Account::SubscriptionPolicy < ApplicationPolicy
  def destroy?
    author?
  end
end