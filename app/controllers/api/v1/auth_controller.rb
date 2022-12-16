# frozen_string_literal: true

module Api
  module V1
    class AuthController < Api::V1::ApplicationController
      def sign_up
        user = Api::V1::SignUpForm.new(params)

        if user.save
          render json: { status: :success, payload: payload(user) }
        else
          render json: { status: :unprocessable_entity, error: user.errors.full_messages }
        end
      rescue UserExistError => e
        render json: { status: 422, error: e.message }
      end
    end
  end
end
