class DrugEntry < ApplicationRecord
  belongs_to :drug
  belongs_to :entry
end
