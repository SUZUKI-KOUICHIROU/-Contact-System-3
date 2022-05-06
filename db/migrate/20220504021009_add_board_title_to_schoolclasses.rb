class AddBoardTitleToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :board_title, :string
  end
end
