class Drug < ApplicationRecord
  belongs_to :prescription
  validates :brand, presence: true
  validates :name, presence: true
  validates :dose, presence: true
end
