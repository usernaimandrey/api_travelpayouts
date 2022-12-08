# frozen_string_literal: true

class Api::V1::Account::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name
end
