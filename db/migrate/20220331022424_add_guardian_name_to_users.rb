class AddGuardianNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :guardian_name, :string
  end
end
