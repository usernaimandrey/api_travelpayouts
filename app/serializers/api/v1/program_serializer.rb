# frozen_string_literal: true

class Api::V1::ProgramSerializer < ActiveModel::Serializer
  attributes :title, :description
end
