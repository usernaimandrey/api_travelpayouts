# frozen_string_literal: true

module Api
  module V1
    class ProgramsController < Api::V1::ApplicationController
      def index
        programs = Program.all

        render json: programs
      end
    end
  end
end
