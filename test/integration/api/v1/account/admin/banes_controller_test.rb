# frozen_string_literal: true

require 'test_helper'

class Api::V1::Account::Admin::BanesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:two)
    @jwt_token = JsonWebToken.encodet({ user_id: @admin.id })
    @user = users(:one)
    @program = programs(:two)
  end

  test 'create bane' do
    post api_v1_account_admin_banes_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: @user.id, program_id: @program.id }, as: :json

    bane = @user.banes.find_by(program_id: @program.id).serializable_hash(only: %i[id user_id program_id]).to_json

    assert { bane == response.body }
  end

  test 'not admin' do
    user = users(:three)
    jwt = JsonWebToken.encodet({ user_id: user.id })

    post api_v1_account_admin_banes_path, headers: { Authorization: "Bearer #{jwt}" }, params: { user_id: @user.id, program_id: @program.id }, as: :json

    expected = { errors: ['Not Authenticated'] }.to_json

    assert { expected == response.body }
  end

  test 'alredy baned' do
    program = programs(:one)

    post api_v1_account_admin_banes_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { user_id: @user.id, program_id: program.id }, as: :json

    expected = { error: I18n.t('bane_exist') }.to_json

    assert { expected == response.body }
  end

  test 'destroy baned' do
    bane = banes(:one)
    delete api_v1_account_admin_bane_path(bane), headers: { Authorization: "Bearer #{@jwt_token}" }, as: :json

    expected = { status: :success }.to_json
    assert { expected == response.body }
  end
end
