class AddPostCodeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :post_code, :integer
  end
end
