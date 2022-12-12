class Api::V1::Account::Admin::BanesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:two)
    @jwt_token = JsonWebToken.encodet({ user_id: @admin.id })
    @user = users(:one)
    @program = programs(:two)
  end

  test '#create' do
    post api_v1_account_admin_banes_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: @user.id, program_id: @program.id }, as: :json

    program_bane = @user.program_banes.find_by(id: @program.id)

    assert { program_bane }

    assert_response :success
  end

  test 'user not admin' do
    user = users(:three)
    jwt = JsonWebToken.encodet({ user_id: user.id })

    post api_v1_account_admin_banes_path, headers: { Authorization: "Bearer #{jwt}" }, params: { user_id: @user.id, program_id: @program.id }, as: :json

    assert_response :unauthorized
  end

  test 'user alredy baned' do
    program = programs(:one)

    post api_v1_account_admin_banes_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: @user.id, program_id: program.id }, as: :json

    assert_response :forbidden
  end

  test 'invalid params' do
    post api_v1_account_admin_banes_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: nil, program_id: @program.id }, as: :json

    program_bane = @user.program_banes.find_by(id: @program.id)

    assert_not(program_bane)

    assert_response :unprocessable_entity
  end
end