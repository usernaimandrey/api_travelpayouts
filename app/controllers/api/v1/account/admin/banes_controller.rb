# frozen_string_literal: true

module Api
  module V1
    module Account
      module Admin
        class BanesController < Api::V1::Account::Admin::ApplicationController
          def create
            bane = Bane.find_or_initialize_by(banes_params)

            raise if bane.persisted?

            if bane.save
              render json: { status: :success }
            else
              render json: { status: :unprocessable_entity, error: bane.errors.full_messages }
            end
          rescue StandardError
            render json: { status: :forbidden, error: I18n.t('bane_exist') }
          end

          def destroy
            bane = Bane.find(params[:id])

            bane.destroy
            render json: { status: success }
          rescue ActiveRecord::RecordNotFound => e
            render json: { status: :not_found, error: e }
          end

          private

          def banes_params
            params.permit(:user_id, :program_id)
          end
        end
      end
    end
  end
end
