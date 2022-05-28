class AddBeforePostCountToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :before_post_count, :integer, default: 0
  end
end
