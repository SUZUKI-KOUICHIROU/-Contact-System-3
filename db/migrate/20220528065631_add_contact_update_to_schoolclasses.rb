class AddContactUpdateToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :contact_update, :datetime
  end
end
