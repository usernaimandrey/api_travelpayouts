# frozen_string_literal: true

module Api
  module V1
    module Account
      module Admin
        class BanesController < Api::V1::Account::Admin::ApplicationController
          def create
            bane = Api::V1::Account::Admin::BaneForm.new(params)

            if bane.save
              render json: bane
            else
              render json: { error: bane.errors.full_messages }, status: :unprocessable_entity
            end
          rescue BaneExistError => e
            render json: { error: e.message }, status: :forbidden
          end

          def destroy
            bane = Bane.find(params[:id])

            bane.destroy
            render json: { status: :success }
          rescue ActiveRecord::RecordNotFound => e
            render json: { status: :not_found, error: e }
          end
        end
      end
    end
  end
end
