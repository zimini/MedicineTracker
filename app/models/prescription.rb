class Prescription < ApplicationRecord
  validates :clinic, presence: true
  belongs_to :user
end
