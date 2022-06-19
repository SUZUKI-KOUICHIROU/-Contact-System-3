class RemoveAddClassnumberIdToStudentsFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_index :students, :classnumber_id
    remove_column :students, :classnumber_id, :string
  end
end
