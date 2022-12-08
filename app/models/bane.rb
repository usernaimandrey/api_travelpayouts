# frozen_string_literal: true

class Bane < ApplicationRecord
  belongs_to :user
  belongs_to :program
end
