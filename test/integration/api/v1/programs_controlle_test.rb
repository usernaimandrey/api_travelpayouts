# frozen_string_literal: true

require 'test_helper'

class Api::V1::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_one = programs(:one)
    @program_two = programs(:two)
    @program_three = programs(:three)
  end
  test 'all program' do
    get api_v1_programs_path, as: :json

    res = response.parsed_body

    assert { @program_one[:id] == res[2]['id'] }
    assert { @program_two[:id] == res[1]['id'] }
    assert { @program_three[:id] == res[0]['id'] }
  end
end
