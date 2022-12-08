# frozen_string_literal: true

module Api
  module V1
    module Account
      class ProgramsController < Api::V1::Account::ApplicationController
        # available programs
        def index
          banned_ids = @current_user.program_banes.select(:id)
          programs = Program.where.not(id: banned_ids)

          render json: programs
        end

        def search
          scope = Program.where('title LIKE ?', "%#{Program.sanitize_sql_like(search_params[:term])}%")
          scope = scope.order(subscribers_count: :desc)

          render json: scope
        end

        private

        def search_params
          params.permit(:term)
        end
      end
    end
  end
end
