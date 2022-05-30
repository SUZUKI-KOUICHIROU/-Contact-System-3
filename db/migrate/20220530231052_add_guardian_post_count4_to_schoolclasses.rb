class AddGuardianPostCount4ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :guardian_post_count4, :integer, default: 0
    add_column :schoolclasses, :before_guardian_postcount4, :integer, default: 0
    add_column :schoolclasses, :contact_update8, :datetime
  end
end
