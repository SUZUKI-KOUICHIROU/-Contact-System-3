class AddGuardianPostCount3ToSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    add_column :schoolclasses, :guardian_post_count3, :integer, default: 0
    add_column :schoolclasses, :before_guardian_postcount3, :integer, default: 0
    add_column :schoolclasses, :contact_update7, :datetime
  end
end
