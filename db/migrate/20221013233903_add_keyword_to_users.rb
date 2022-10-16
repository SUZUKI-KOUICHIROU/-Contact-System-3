class AddKeywordToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :keyword, :string
  end
end
