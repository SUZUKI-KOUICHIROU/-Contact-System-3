class AddTeacherNoteToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :teacher_note, :string
  end
end
