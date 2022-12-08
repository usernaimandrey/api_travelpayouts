# frozen_string_literal: true

class Subscription < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :program, counter_cache: :subscribers_count

  aasm column: :state do
    state :active, initial: true
    state :baned

    event :to_bane do
      transitions from: :active, to: :baned
    end

    event :unbane do
      transitions from: :baned, to: :active
    end
  end
end
