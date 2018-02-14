class CreateDrugEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :drug_entries do |t|
      t.references :drug, foreign_key: true
      t.references :entry, foreign_key: true
      t.integer :result
      t.text :comments
      t.date :date

      t.timestamps
    end
  end
end
