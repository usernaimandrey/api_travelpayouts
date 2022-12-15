# frozen_string_literal: true

module Api
  module V1
    module Account
      class SubscriptionsController < Api::V1::Account::ApplicationController
        def create
          subscription = Subscription.find_or_initialize_by(subscription_params)

          raise if subscription.persisted?

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

        private

        def subscription_params
          params.permit(:user_id, :program_id)
        end
      end
    end
  end
end
