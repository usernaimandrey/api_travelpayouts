# frozen_string_literal: true

module Api
  module V1
    module Account
      class UsersController < Api::V1::Account::ApplicationController
        def show
          user = User.find(params[:id])
          render json: user
        rescue ActiveRecord::RecordNotFound => e
          render json: { satus: :not_found, error: e }
        end

        def programs
          programs = @current_user.programs

          render json: programs
        end
      end
    end
  end
end
