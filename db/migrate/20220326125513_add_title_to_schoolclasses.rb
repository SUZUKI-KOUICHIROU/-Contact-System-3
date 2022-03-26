class AddTitleToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :title, :string
  end
end
