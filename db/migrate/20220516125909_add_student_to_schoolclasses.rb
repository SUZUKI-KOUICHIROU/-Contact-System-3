class AddStudentToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :student_name, :string
    add_column :schoolclasses, :birthday, :date
    add_column :schoolclasses, :class_belongs, :string
    add_column :schoolclasses, :student_number, :integer
    add_column :schoolclasses, :guardian_name, :string
  end
end
