class AddImageToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :image, :string
  end
end
