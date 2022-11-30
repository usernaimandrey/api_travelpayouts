class Program < ApplicationRecord
  validates :title, presence: true
  validetes :title, length: { minimum: 2, maximum: 50 }
  validetes :description, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }
end
