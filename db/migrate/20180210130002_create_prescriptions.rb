class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.string :clinic
      t.date :date

      t.timestamps
    end
  end
end
