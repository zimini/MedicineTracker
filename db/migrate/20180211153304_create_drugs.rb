class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.string :brand
      t.string :name
      t.string :dose

      t.timestamps
    end
  end
end
