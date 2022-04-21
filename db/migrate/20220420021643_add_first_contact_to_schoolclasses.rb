class AddFirstContactToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :first_contact, :integer, default: 0
  end
end
