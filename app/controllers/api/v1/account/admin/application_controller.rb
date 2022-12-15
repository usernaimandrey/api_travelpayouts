# frozen_string_literal: true

module Api
  module V1
    module Account
      module Admin
        class ApplicationController < Api::V1::Account::ApplicationController
          before_action :admin_authenticate_request! do
            self.namespace_for_serializer = Api::V1::Account::Admin
          end

          private

          def admin_authenticate_request!
            return if @current_user.admin?

            render json: { errors: ['Not Authenticated'] }, status: :unauthorized
            nil
          end
        end
      end
    end
  end
end
