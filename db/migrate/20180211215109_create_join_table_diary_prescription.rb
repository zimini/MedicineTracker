class CreateJoinTableDiaryPrescription < ActiveRecord::Migration[5.1]
  def change
    create_join_table :diaries, :prescriptions do |t|
      t.index [:diary_id, :prescription_id]
      t.index [:prescription_id, :diary_id]
    end
  end
end
