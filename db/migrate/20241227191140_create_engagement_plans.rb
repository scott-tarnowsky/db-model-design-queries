class CreateEngagementPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :engagement_plans do |t|
      t.belongs_to :patient
      t.belongs_to :provider
      t.string :plan_type

      t.timestamps
    end
  end
end
