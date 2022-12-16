# frozen_string_literal: true

module Api
  module V1
    module Account
      class ApplicationController < Api::V1::ApplicationController
        include Pundit::Authorization

        rescue_from Pundit::NotAuthorizedError, with: :user_not_author

        before_action :authenticate_request! do
          self.namespace_for_serializer = Api::V1::Account
        end

        def user_not_author(exception)
          policy_name = exception.policy.class.to_s.underscore
          massage = I18n.t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default

          render json: { error: massage }, status: :unauthorized
        end
      end
    end
  end
end
