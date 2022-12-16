# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require_relative '../app/errors/user_exist_error'
require_relative '../app/errors/subscrip_exist_error'
require_relative '../app/errors/bane_exist_error'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include AuthConcern

  def sign_in_as(name)
    user = users(name)

    post api_v1_sessions_path, params: { values: { email: user.email, password: 'password' } }
    user
  end
end
