class AddGuardianNoteToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :guardian_note_1, :string
    add_column :schoolclasses, :guardian_note_2, :string
    add_column :schoolclasses, :guardian_note_3, :string
    add_column :schoolclasses, :guardian_note_4, :string
  end
end
