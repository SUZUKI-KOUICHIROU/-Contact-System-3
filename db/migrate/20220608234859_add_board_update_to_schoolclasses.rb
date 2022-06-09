class AddBoardUpdateToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :board_update, :datetime
  end
end
