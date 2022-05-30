class AddGuardianPostCount2ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :guardian_post_count2, :integer, default: 0
    add_column :schoolclasses, :before_guardian_postcount2, :integer, default: 0
    add_column :schoolclasses, :contact_update6, :datetime
  end
end
