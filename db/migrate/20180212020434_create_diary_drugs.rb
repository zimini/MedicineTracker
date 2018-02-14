class CreateDiaryDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :diary_drugs do |t|
      t.references :diary, foreign_key: true
      t.references :drug, foreign_key: true
      t.integer :result
      t.text :comments
      t.date :date

      t.timestamps
    end
  end
end
