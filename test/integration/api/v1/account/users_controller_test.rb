# frozen_string_literal: true

require 'test_helper'

class Api::V1::Account::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @jwt_token = JsonWebToken.encodet({ user_id: @user.id })
  end

  test 'user show' do
    get api_v1_account_user_path(@user), headers: { Authorization: "Bearer #{@jwt_token}" }, as: :json

    expected = @user.serializable_hash(only: %i[id email name]).to_json

    assert { expected == response.body }
  end

  test 'accessible programs' do
    get programs_api_v1_account_users_path, headers: { Authorization: "Bearer #{@jwt_token}" }, as: :json

    expected = @user.program_subscriptions.map { |program| program.serializable_hash(only: %i[id title description subscribers_count]) }.to_json

    assert { expected == response.body }
  end

  test 'unauthorized' do
    get api_v1_account_user_path(@user), headers: { Authorization: 'Bearer' }, as: :json

    expected = { errors: ['Not Authenticated'] }.to_json

    assert { expected == response.body }
  end
end
