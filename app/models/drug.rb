class Drug < ApplicationRecord
  validates :brand, presence: true
  validates :name, presence: true
  validates :dose, presence: true

  # associations
  belongs_to :user
  # belongs_to :prescription
  has_and_belongs_to_many :prescriptions,  dependent: :destroy
  has_many :diary_drugs, dependent: :destroy
end
