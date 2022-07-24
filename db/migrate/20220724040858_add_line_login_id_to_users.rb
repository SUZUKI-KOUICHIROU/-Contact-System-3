class AddLineLoginIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :line_login_id, :integer
    add_column :users, :line_login_secret, :string
  end
end
