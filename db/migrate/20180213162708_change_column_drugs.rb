class ChangeColumnDrugs < ActiveRecord::Migration[5.1]
  def change
    # rename_column, :drugs, :prescription_id, :user_id
    add_reference :drugs, :user, foreign_key: true
  end
end
