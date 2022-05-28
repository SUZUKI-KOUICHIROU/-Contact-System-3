class AddPostCountToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :post_count, :integer, default: 0
  end
end
