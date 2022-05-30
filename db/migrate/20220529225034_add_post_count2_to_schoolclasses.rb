class AddPostCount2ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :post_count2, :integer, default: 0
    add_column :schoolclasses, :before_post_count2, :integer, default: 0
    add_column :schoolclasses, :contact_update3, :datetime
  end
end
