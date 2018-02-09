class AddUserToDiaries < ActiveRecord::Migration[5.1]
  def change
    add_reference :diaries, :user, foreign_key: true
  end
end
