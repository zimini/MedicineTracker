class Prescription < ApplicationRecord
  validates :clinic, presence: true
  belongs_to :user
  has_and_belongs_to_many :diaries
  has_many :drugs
end
