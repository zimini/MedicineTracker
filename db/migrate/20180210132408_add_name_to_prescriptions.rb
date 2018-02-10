class AddNameToPrescriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :prescriptions, :name, :string
  end
end
