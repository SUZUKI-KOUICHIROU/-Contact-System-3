class CreateClassnumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :classnumbers do |t|
      t.string :class_name

      t.timestamps
    end
  end
end
