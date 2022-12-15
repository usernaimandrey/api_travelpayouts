# frozen_string_literal: true

require 'test_helper'

class Api::V1::Account::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @jwt_token = JsonWebToken.encodet({ user_id: @user.id })
    @program = programs(:two)
  end

  test 'create subscription' do
    post api_v1_account_subscriptions_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: @user.id, program_id: @program.id }, as: :json

    expected = { status: :success }.to_json

    assert { expected == response.body }
  end

  test 'subscription alredy exist' do
    program = programs(:one)
    post api_v1_account_subscriptions_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: @user.id, program_id: program.id }, as: :json

    expected = { error: I18n.t('subscrip_alredy_exist') }.to_json

    assert { expected == response.body }
  end

  test 'destroy subscribers' do
    program = programs(:one)
    delete api_v1_account_subscription_path(program), headers: { Authorization: "Bearer #{@jwt_token}" }

    expected = { status: :success }.to_json
    assert { expected == response.body }
  end
end
