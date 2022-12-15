# frozen_string_literal: true

class Api::V1::Account::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @jwt_token = JsonWebToken.encodet({ user_id: @user.id })
    @program = programs(:two)
  end

  test '#index' do
    get api_v1_account_programs_path, headers: { Authorization: "Bearer #{@jwt_token}" }, as: :json

    assert_response :success
  end

  test '#search' do
    get search_api_v1_account_programs_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { term: 'MyS' }, as: :json

    assert_response :success
  end
end
