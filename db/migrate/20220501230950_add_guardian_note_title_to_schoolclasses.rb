class AddGuardianNoteTitleToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :title_3, :string
    add_column :schoolclasses, :title_4, :string
  end
end
