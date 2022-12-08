# frozen_string_literal: true

class Api::V1::ProgramsControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get api_v1_programs_path

    assert_response :success
  end
end