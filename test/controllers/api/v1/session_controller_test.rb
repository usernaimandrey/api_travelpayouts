# frozen_string_literal: true

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  test '#create' do
    user = users(:one)
    attrs = {
      email: user.email,
      password: 'password'
    }

    post api_v1_sessions_path, params: attrs, as: :json

    assert_response :success
    assert { signed_in? }
  end
end
