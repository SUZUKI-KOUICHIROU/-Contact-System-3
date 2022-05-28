class AddContactUpdate2ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :contact_update2, :datetime
  end
end
