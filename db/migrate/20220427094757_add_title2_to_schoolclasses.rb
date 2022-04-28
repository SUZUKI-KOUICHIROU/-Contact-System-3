class AddTitle2ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :title_2, :string
  end
end
