class AddTeacherLineToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :teacher_line, :string
    add_column :schoolclasses, :line_class, :string
  end
end
