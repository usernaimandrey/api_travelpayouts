# frozen_string_literal: true

module Api
  module V1
    module Account
      class ApplicationController < Api::V1::ApplicationController
        before_action :authenticate_request! do
          self.namespace_for_serializer = Api::V1::Account
        end
      end
    end
  end
end
