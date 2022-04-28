class AddTeacherNote2ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :teacher_note_2, :string
  end
end
