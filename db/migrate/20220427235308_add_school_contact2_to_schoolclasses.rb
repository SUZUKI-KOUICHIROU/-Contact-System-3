class AddSchoolContact2ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :school_contact_2, :string
  end
end
