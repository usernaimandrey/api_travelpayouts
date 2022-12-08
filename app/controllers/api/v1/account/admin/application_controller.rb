# frozen_string_literal: true

module Api
  module V1
    module Account
      module Admin
        class ApplicationController < Api::V1::Account::ApplicationController
          before_action :admin_signed_in?
        end
      end
    end
  end
end
