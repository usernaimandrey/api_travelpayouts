# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Api::V1::ApplicationController
      include Swagger::Docs::Methods

      swagger_controller :sessions, 'Auth in api'

      def create
        user = User.find_by(email: session_params[:email])
        raise ActiveRecord::RecordNotFound unless user

        if user.authenticate(session_params[:password])
          sign_in(user)
          render json: { payload: payload(user) }
        else
          render json: { status: :unauthorized, error: I18n.t('check_email') }
        end
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.debug e
        render json: { satus: :not_found, error: I18n.t('user_not_found', email: session_params[:email]) }
      end

      # swagger_api :create do
      #   summary 'Sign in in this app'
      #   notes 'This signed in user endpoin'
      #   param :form, :email, :password, :string, 'email user'
      #   param :form, :password, :string, 'password user'
      #   response :unauthorized, 'check email or password'
      #   response :success
      #   response :not_found, 'user not found'
      # end

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
