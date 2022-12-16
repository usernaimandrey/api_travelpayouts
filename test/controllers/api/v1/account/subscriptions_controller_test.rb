# frozen_string_literal: true

class Api::V1::Account::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @jwt_token = JsonWebToken.encodet({ user_id: @user.id })
    @program = programs(:two)
  end

  test '#create' do
    post api_v1_account_subscriptions_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: @user.id, program_id: @program.id }, as: :json

    @user.reload

    new_subscriptin = @user.program_subscriptions.find_by(id: @program.id)

    assert_response :success
    assert { new_subscriptin }
  end

  test '#create duble subscriptions' do
    program = programs(:one)
    post api_v1_account_subscriptions_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: @user.id, program_id: program.id }, as: :json

    @user.reload

    new_subscriptin = @user.program_subscriptions.find_by(id: @program.id)

    assert_response :forbidden
    assert_not(new_subscriptin)
  end

  test '#destroy' do
    program = programs(:one)
    delete api_v1_account_subscription_path(program), headers: { Authorization: "Bearer #{@jwt_token}" }

    subscription = @user.program_subscriptions.find_by(id: program.id)

    assert_not(subscription)
    assert_response :success
  end

  test '#destroy not author' do
    delete api_v1_account_subscription_path(@program), headers: { Authorization: "Bearer #{@jwt_token}" }
    @program.reload

    assert { @program }
    assert_response :unauthorized
  end
end
