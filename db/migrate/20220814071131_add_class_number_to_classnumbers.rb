class AddClassNumberToClassnumbers < ActiveRecord::Migration[7.0]
  def change
    add_column :classnumbers, :school_year, :string
    add_column :classnumbers, :school_class, :string
  end
end
