class AddGuardianCount1ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :guardian_post_count1, :integer, default: 0
    add_column :schoolclasses, :before_guardian_postcount1, :integer, default: 0
    add_column :schoolclasses, :contact_update5, :datetime
  end
end
