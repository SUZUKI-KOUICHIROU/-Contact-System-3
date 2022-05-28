class AddContactCount2ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :contact_count2, :integer, default: 0
    add_column :schoolclasses, :before_contact2, :integer, default: 0
  end
end
