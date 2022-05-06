class AddContactBoardToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :contact_board, :string
  end
end
