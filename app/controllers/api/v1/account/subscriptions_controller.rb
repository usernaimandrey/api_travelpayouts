# frozen_string_literal: true

module Api
  module V1
    module Account
      class SubscriptionsController < Api::V1::Account::ApplicationController
        after_action :verify_authorized, only: %i[destroy]

        def create
          subscription = Api::V1::Account::SubscriptionForm.new(params)

          if subscription.save
            render json: { status: :success }
          else
            render json: { status: :unprocessable_entity, error: subscription.errors.full_messages }
          end
        rescue StandardError => e
          render json: { error: e.message }, status: :forbidden
        end

        def destroy
          subscription = Subscription.find(params[:id])
          authorize([:api, :v1, :account, subscription])

          subscription.destroy
          render json: { status: :success }
        rescue ActiveRecord::RecordNotFound => e
          render json: { status: :unprocessable_entity, error: e }
        end
      end
    end
  end
end
