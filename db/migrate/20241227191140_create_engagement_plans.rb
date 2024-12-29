class CreateEngagementPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :engagement_plans do |t|
      t.references :patient, foreign_key: true
      t.references :provider, foreign_key: true
      t.string :plan_type

      t.timestamps
    end
  end
end
