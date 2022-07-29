class AddUserLineTitleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :line_login_id, :integer, null: false
    add_column :users, :line_login_secret, :string, null: false
  end
end
