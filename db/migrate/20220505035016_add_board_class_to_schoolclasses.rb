class AddBoardClassToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :board_class, :string
  end
end
