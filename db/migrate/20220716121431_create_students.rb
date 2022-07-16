class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :student_name
      t.date :birthday
      t.string :class_belongs
      t.integer :student_number
      t.string :guardian_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
