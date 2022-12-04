# frozen_string_literal: true

module Api
  class ApplicationController < ApplicationController
    include AuthConcern

    def payload(user)
      return nil unless user

      {
        auth_token: JsonWebToken.encodet({ user_id: user.id }),
        user_id: user.id
      }
    end
  end
end
