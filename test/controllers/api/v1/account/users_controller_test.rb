class Api::V1::Account::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @jwt_token = JsonWebToken.encodet({ user_id: @user.id })
  end

  test '#show' do
    get api_v1_account_user_path(@user), headers: { Authorization: "Bearer #{@jwt_token}" }, as: :json

    assert_response :success
  end

  test '#show unauthtorize user' do
    get api_v1_account_user_path(@user), headers: { Authorization: "Bearer" }, as: :json

    assert_response :unauthorized
  end
end