class DiaryDrug < ApplicationRecord
  # constants
  RESULTS = {
    1 => 'Feel Very Bad',
    2 => 'Feel Bad',
    3 => 'Feel Fine',
    4 => 'Feel Good',
    5 => 'Feel Very Good'
  }

  # associations
  belongs_to :diary
  belongs_to :drug

  # validations
  validates :result, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
