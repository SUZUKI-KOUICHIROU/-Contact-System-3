class AddNameToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :name, :string
  end
end
