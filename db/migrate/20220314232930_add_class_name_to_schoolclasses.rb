class AddClassNameToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :class_name, :string
  end
end
