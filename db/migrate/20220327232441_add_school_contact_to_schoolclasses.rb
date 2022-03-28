class AddSchoolContactToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :school_contact, :string
  end
end
