# frozen_string_literal: true

require 'test_helper'

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @attrs = {
      email: @user.email,
      password: 'password'
    }
  end

  test 'create session' do
    jwt = JsonWebToken.encodet({ user_id: @user.id })

    expected = { payload: { auth_token: jwt, user_id: @user.id } }.to_json

    post api_v1_sessions_path, params: @attrs, as: :json

    assert { response.body == expected }
  end

  test '#invalid params' do
    @attrs[:password] = nil

    post api_v1_sessions_path, params: @attrs, as: :json

    expected = { status: :unauthorized, error: I18n.t('check_email') }.to_json

    assert { response.body == expected }
  end

  test '# not find user in db' do
    attrs = {
      email: 'notfind@mail.ru',
      password: 'password'
    }

    post api_v1_sessions_path, params: attrs, as: :json

    expected = { satus: :not_found, error: I18n.t('user_not_found', email: attrs[:email]) }.to_json

    assert { expected == response.body }
  end
end
