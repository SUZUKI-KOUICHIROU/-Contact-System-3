class AddClassNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :class_number, :string
  end
end
