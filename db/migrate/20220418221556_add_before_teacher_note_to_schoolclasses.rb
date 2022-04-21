class AddBeforeTeacherNoteToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :before_teacher_note, :string
  end
end
