class CreateSchoolclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :schoolclasses do |t|
      t.date :contact_date
      t.string :note
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
