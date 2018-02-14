class Diary < ApplicationRecord
  validates :title, presence: true

  # associations
  belongs_to :user
  # has_and_belongs_to_many :prescriptions
  # has_many :entries
  has_one :prescription
  has_many :diary_drugs, dependent: :destroy
  # has_many :drugs, through: :diary_drugs
end
