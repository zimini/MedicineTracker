class AddDiaryToPrescription < ActiveRecord::Migration[5.1]
  def change
    add_reference :prescriptions, :diary, foreign_key: true
  end
end
