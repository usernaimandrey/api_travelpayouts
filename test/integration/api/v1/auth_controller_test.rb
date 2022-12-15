# frozen_string_literal: true

require 'test_helper'

class Api::V1::AuthControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs = {
      name: 'Vasy',
      email: 'test@mail.ru',
      password: '123456',
      password_confirmation: '123456'
    }
  end
  test 'registration test' do
    post api_v1_auth_path, params: @attrs, as: :json

    user = User.find_by(email: @attrs[:email])
    expected_jwt = JsonWebToken.encodet({ user_id: user.id })

    expected = { status: :success, payload: { auth_token: expected_jwt, user_id: user.id } }.to_json

    assert { response.body == expected }
  end

  test 'user alredy exist' do
    user = users(:one)

    @attrs[:email] = user.email

    post api_v1_auth_path, params: @attrs, as: :json

    expected = { status: 422, error: I18n.t('user_exist') }.to_json

    assert { expected == response.body }
  end

  test 'auth whith invalid params' do
    user = User.new
    user.save
    expected = { status: :unprocessable_entity, error: user.errors.full_messages }.to_json

    post api_v1_auth_path, params: {}, as: :json

    assert { expected == response.body }
  end
end
