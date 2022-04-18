class AddNextTeacherNoteToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :next_teacher_note, :string
  end
end
