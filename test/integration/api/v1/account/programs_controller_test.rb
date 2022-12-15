# frozen_string_literal: true

require 'test_helper'

class Api::V1::Account::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @jwt_token = JsonWebToken.encodet({ user_id: @user.id })
    @program = programs(:two)
  end

  test 'available programs' do
    banned_ids = @user.program_banes.select(:id)
    programs = Program.where.not(id: banned_ids).map { |program| program.serializable_hash(only: %i[id title description subscribers_count]) }.to_json

    get api_v1_account_programs_path, headers: { Authorization: "Bearer #{@jwt_token}" }, as: :json

    assert { programs == response.body }
  end

  test 'search program' do
    get search_api_v1_account_programs_path, headers: { Authorization: "Bearer #{@jwt_token}" }, params: { term: @program.title }, as: :json

    expected = [@program.serializable_hash(only: %i[id title description subscribers_count])].to_json

    assert { expected == response.body }
  end
end
