# frozen_string_literal: true

class Api::V1::Account::Admin::BaneForm < Bane
  include ActiveFormModel

  fields :user_id, :program_id

  validate :bane_exist?

  def bane_exist?
    @bane = Bane.find_by(user_id: user_id, program_id: program_id)
    raise BaneExistError unless @bane.nil?
  end
end
