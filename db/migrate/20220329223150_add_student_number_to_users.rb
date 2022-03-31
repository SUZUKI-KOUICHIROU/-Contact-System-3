class AddStudentNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :student_number, :integer
  end
end
