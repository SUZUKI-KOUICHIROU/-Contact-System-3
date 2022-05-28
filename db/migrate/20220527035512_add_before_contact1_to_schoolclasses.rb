class AddBeforeContact1ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :before_contact1, :integer, default: 0
  end
end
