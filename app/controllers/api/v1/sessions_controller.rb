module Api
  module V1
    class SessionsController < Api::V1::ApplicationController
      def create
        user = User.find_by(email: session_params[:email])
        raise ActiveRecord::RecordNotFound unless user

        if user.authenticate(session_params[:password])
          sign_in(user)
          render json: { status: :success, payload: payload(user) }
        else
          render json: { status: :unauthorized, error: 'Check email or password' }
        end

      rescue ActiveRecord::RecordNotFound => e
        render json: { satus: :not_found, error: e  }
      end

      def destroy
        return unless signed_in?

        sign_out
        render json: { status: :success }
      end

      private

      def session_params
        params.permit(:email, :password)
      end
    end
  end
end