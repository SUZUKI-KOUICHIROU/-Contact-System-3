class Students < ActiveRecord::Migration[7.0]
  def change
    drop_table :students
  end
end
