class AddSchoolYearToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :school_year, :string
  end
end
