class AddLineTokenToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :line_token, :string
  end
end
