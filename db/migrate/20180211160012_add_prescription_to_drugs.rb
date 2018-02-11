class AddPrescriptionToDrugs < ActiveRecord::Migration[5.1]
  def change
    add_reference :drugs, :prescription, foreign_key: true
  end
end
