# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :program, counter_cache: :subscribers_count
end
