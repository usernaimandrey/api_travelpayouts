# frozen_string_literal: true

class Api::V1::Account::ProgramSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :subscribers_count
end
