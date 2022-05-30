class AddPostCount3ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :post_count3, :integer, default: 0
    add_column :schoolclasses, :before_post_contact3, :integer, default: 0
    add_column :schoolclasses, :contact_update4, :datetime
  end
end
