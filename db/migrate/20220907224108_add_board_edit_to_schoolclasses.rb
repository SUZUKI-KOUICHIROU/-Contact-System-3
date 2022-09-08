class AddBoardEditToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :board_edit, :integer, default: 0
  end
end
