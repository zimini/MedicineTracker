class Prescription < ApplicationRecord
  validates :clinic, presence: true

  # associations
  belongs_to :user
  # has_and_belongs_to_many :diaries
  # belongs_to :diary
  # has_many :drugs
  has_and_belongs_to_many :drugs,  dependent: :destroy
end
