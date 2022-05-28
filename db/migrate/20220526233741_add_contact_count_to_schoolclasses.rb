class AddContactCountToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :contact_count1, :integer, default: 0
  end
end
