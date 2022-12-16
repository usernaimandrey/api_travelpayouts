# frozen_string_literal: true

class Api::V1::Account::SubscriptionForm < Subscription
  include ActiveFormModel

  fields :user_id, :program_id

  validate :subscriber_exist?

  def subscriber_exist?
    @subscriber = Subscription.find_by(user_id: user_id, program_id: program_id)
    raise SubscripExistError unless @subscriber.nil?
  end
end
