# frozen_string_literal: true

module Api
  module V1
    module Account
      class SubscriptionsController < Api::V1::Account::ApplicationController
        def create
          subscription = Api::V1::Account::SubscriptionForm.new(params)

          if subscription.save
            render json: { status: :success }
          else
            render json: { status: :unprocessable_entity, error: subscription.errors.full_messages }
          end
        rescue StandardError
          render json: { error: I18n.t('subscrip_alredy_exist') }, status: :forbidden
        end

        def destroy
          subscription = Subscription.find(params[:id])

          subscription.destroy
          render json: { status: :success }
        rescue ActiveRecord::RecordNotFound => e
          render json: { status: :unprocessable_entity, error: e }
        end
      end
    end
  end
end
