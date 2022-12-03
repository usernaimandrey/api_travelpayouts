module Api
  module V1
    class AuthController < Api::V1::ApplicationController
      def sign_up
        user = User.find_by(email: user_params[:email])
        raise if user

        user = User.new(user_params)
        if user.save
          render json: { status: :success, payload: payload(user) }
        else
          render json: { status: :unprocessable_entity, error: user.errors.full_messages }
        end

      rescue StandardError
        render json: { status: 422, error: 'User alredy exist' }
      end

      private

      def user_params
        params.permit(:email, :name, :password, :password_confirmation)
      end
    end
  end
end