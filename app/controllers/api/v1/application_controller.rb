# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < Api::ApplicationController
      before_action do
        self.namespace_for_serializer = Api::V1
      end
    end
  end
end
