class AddRangeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :range, :string
  end
end
