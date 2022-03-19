class CreateClassNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :class_numbers do |t|
      t.string :class_name

      t.timestamps
    end
  end
end
