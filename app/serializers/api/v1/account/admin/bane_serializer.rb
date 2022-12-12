# frozen_string_literal: true

class Api::V1::Account::Admin::BaneSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :program_id
end
